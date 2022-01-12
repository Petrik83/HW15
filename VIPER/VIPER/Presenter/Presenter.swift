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

protocol AnyPresenter: class {
    var router: AnyRouter? { get set }
    var interactor: AnyInteractor? { get set }
    var view: AnyView? { get set }
    var tableViewCell: AnyTableViewCell? { get set }

    func interactorDidFetchSettingsPoints(with result: [[SettingsPoint]])
    func getCurrentSettingsPoint(with indexPath: IndexPath) -> SettingsPoint?
}

class SettingsAppPresenter: AnyPresenter {

    //MARK: - Properties

    var interactor: AnyInteractor? {
        didSet {
            interactor?.getSettingsPoints()
        }
    }

    var view: AnyView?
    var router: AnyRouter?
    var tableViewCell: AnyTableViewCell?

    //MARK: - Functions

    func interactorDidFetchSettingsPoints(with result: [[SettingsPoint]]) {
        view?.getSettingsPoints(with: result)
    }

    func getCurrentSettingsPoint(with indexPath: IndexPath) -> SettingsPoint? {
        guard let settingsPoints = view?.settingsPoints else { return nil }
        return settingsPoints[indexPath.section][indexPath.row]
    }

    func pushViewController(_ viewController: AnyView) {
        view?.pushViewController(viewController)
    }
}
