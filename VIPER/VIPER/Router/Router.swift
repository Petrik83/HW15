//
//  Router.swift
//  VIPER
//
//  Created by Дмитрий Казанков on 02.01.2022.
//

import Foundation
//import UIKit

//Object
//Entry point
typealias EntryPoint = AnyView //& UIViewController

protocol AnyRouter {
    //var view: EntryPoint? { get }
    var presenter: AnyPresenter? { get }

    static func start() -> SettingsAppRouter
    func openAnotherScreen()
}

class SettingsAppRouter: AnyRouter {
    //weak var view: EntryPoint?
    weak var presenter: AnyPresenter?

    static func start() -> SettingsAppRouter {
        let router = SettingsAppRouter()

        var view: EntryPoint = SettingsAppViewController()
        var interactor: AnyInteractor = SettingsAppInteractor()
        var presenter: AnyPresenter = SettingsAppPresenter()

        view.presenter = presenter
        interactor.presenter = presenter
        router.presenter = presenter

        presenter.router = router
        presenter.view = view
        presenter.interactor = interactor

        //router.view = view

        return router
    }

    func openAnotherScreen() {
        let newViewController = SettingsAppViewController()
        newViewController.view.backgroundColor = .red
        presenter?.view?.pushViewController(newViewController)
        //let view = presenter?.view as? UIViewController
        //view?.navigationController?.pushViewController(newViewController, animated: true)
        //view?.present(newViewController, animated: true, completion: nil)
    }


}
