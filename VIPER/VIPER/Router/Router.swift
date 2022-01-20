//
//  Router.swift
//  VIPER
//
//  Created by Дмитрий Казанков on 02.01.2022.
//

import Foundation

protocol SettingsRouterProtocol: AnyObject {
    var presenter: SettingsPresenterProtocol? { get set }

    static func start() -> SettingsViewProtocol
    func openAnotherScreen()
}

class SettingsAppRouter: SettingsRouterProtocol {
    weak var presenter: SettingsPresenterProtocol?

    static func start() -> SettingsViewProtocol {
        let router = SettingsAppRouter()

        let view: SettingsViewProtocol = SettingsAppViewController()
        let interactor: SettingsInteractorProtocol = SettingsAppInteractor()
        let presenter: SettingsPresenterProtocol = SettingsAppPresenter()

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
