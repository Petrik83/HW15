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

    func interctorDidFetchSettingsPoints(with result: [SettingsPoint])
}

class UserPresenter: AnyPresenter {
    //MARK: - Properties

    var interactor: AnyInteractor? {
        didSet {
            interactor?.getSettingsPoints()
        }
    }

    var view: AnyView?
    var router: AnyRouter?

    //MARK: - Functions

    func interctorDidFetchSettingsPoints(with result: [SettingsPoint]) {
        view?.update(with: result)
    }
}
