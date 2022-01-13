//
//  Router.swift
//  VIPER
//
//  Created by Дмитрий Казанков on 02.01.2022.
//

import Foundation

protocol AnyRouter {
    var presenter: AnyPresenter? { get }

    static func start() -> SettingsAppRouter
    func openAnotherScreen()
}

class SettingsAppRouter: AnyRouter {
    weak var presenter: AnyPresenter?

    static func start() -> SettingsAppRouter {
        let router = SettingsAppRouter()

        let view: AnyView = SettingsAppViewController()
        let interactor: AnyInteractor = SettingsAppInteractor()
        let presenter: AnyPresenter = SettingsAppPresenter()

        view.presenter = presenter
        interactor.presenter = presenter
        router.presenter = presenter

        presenter.router = router
        presenter.view = view
        presenter.interactor = interactor

        return router
    }

    func openAnotherScreen() {
        let newViewController = SettingsAppViewController()
        presenter?.pushViewController(newViewController)
    }

}
