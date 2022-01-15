//
//  Router.swift
//  VIPER
//
//  Created by Дмитрий Казанков on 02.01.2022.
//

import Foundation

protocol AnyRouter: AnyObject {
    var presenter: AnyPresenter? { get set }

    static func start() -> AnyView
    func openAnotherScreen()
}

class SettingsAppRouter: AnyRouter {
    weak var presenter: AnyPresenter?

    static func start() -> AnyView {
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

        return view
    }

    func openAnotherScreen() {
        let newViewController = SettingsAppViewController()
        presenter?.pushViewController(newViewController)
    }

}
