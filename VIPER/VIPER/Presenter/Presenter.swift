//
//  Presenter.swift
//  VIPER
//
//  Created by Дмитрий Казанков on 02.01.2022.
//

import Foundation

//object
//protocol
//ref to interactor, router, view

enum FetchError: Error {
    case failed
}

protocol AnyPresenter {
    var router: AnyRouter? { get set }
    var interactor: AnyInteractor? { get set }
    var view: AnyView? { get set }
    var tableViewCell: AnyTableViewCell? { get set }

    func interactorDidFetchSettingsPoints(with result: [[SettingsPoint]])
    func getCurrentSettingsPoint(with indexPath: IndexPath) -> SettingsPoint?
}

class UserPresenter: AnyPresenter {
    var tableViewCell: AnyTableViewCell?

    //MARK: - Properties

    var interactor: AnyInteractor? {
        didSet {
            interactor?.getSettingsPoints()
        }
    }

    var view: AnyView?
    var router: AnyRouter?

    //MARK: - Functions

    func interactorDidFetchSettingsPoints(with result: [[SettingsPoint]]) {
        view?.getSettingsPoints(with: result)
    }

    func getCurrentSettingsPoint(with indexPath: IndexPath) -> SettingsPoint? {
        guard let settingsPoints = view?.settingsPoints else { return nil }
        return settingsPoints[indexPath.section][indexPath.row]
    }
}
