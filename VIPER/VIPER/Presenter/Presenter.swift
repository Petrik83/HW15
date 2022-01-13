//
//  Presenter.swift
//  VIPER
//
//  Created by Дмитрий Казанков on 02.01.2022.
//

import Foundation

protocol AnyPresenter: AnyObject {
    var router: AnyRouter? { get set }
    var interactor: AnyInteractor? { get set }
    var view: AnyView? { get set }
    var settingsPoints: [[SettingsPoint]]? { get set }

    func viewDidLoad()
    func interactorDidFetchSettingsPoints(with result: [[SettingsPoint]])
    func getCurrentSettingsPoint(with indexPath: IndexPath) -> SettingsPoint?
    func numberOfRowsInSection(_ section: Int) -> Int
    func numberOfSections() -> Int
    func openAnotherScreen()
    func pushViewController(_ viewController: AnyView)

}

class SettingsAppPresenter: AnyPresenter {

    //MARK: - Properties

    var interactor: AnyInteractor?
    var view: AnyView?
    var router: AnyRouter?
    var settingsPoints: [[SettingsPoint]]?

    //MARK: - Functions
    func viewDidLoad() {
        interactor?.getSettingsPoints()
    }

    func interactorDidFetchSettingsPoints(with result: [[SettingsPoint]]) {
        settingsPoints = result
    }

    func getCurrentSettingsPoint(with indexPath: IndexPath) -> SettingsPoint? {
        guard let settingsPoints = settingsPoints else { return nil }
        return settingsPoints[indexPath.section][indexPath.row]
    }

    func numberOfRowsInSection(_ section: Int) -> Int {
        guard let settingsPoints = settingsPoints else { return 0 }
        return settingsPoints[section].count
    }

    func numberOfSections() -> Int {
        guard let settingsPoints = settingsPoints else { return 0 }
        return settingsPoints.count
    }

    func openAnotherScreen() {
        router?.openAnotherScreen()
    }

    func pushViewController(_ viewController: AnyView) {
        view?.pushViewController(viewController)
    }
}
