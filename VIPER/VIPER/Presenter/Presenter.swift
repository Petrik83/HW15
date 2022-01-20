//
//  Presenter.swift
//  VIPER
//
//  Created by Дмитрий Казанков on 02.01.2022.
//

import Foundation

protocol SettingsPresenterProtocol: AnyObject {
    var router: SettingsRouterProtocol? { get set }
    var interactor: SettingsInteractorProtocol? { get set }
    var view: SettingsViewProtocol? { get set }

    var settingsPoints: [[SettingsPoint]]? { get set }
    func getStartingData()
    func interactorDidFetchSettingsPoints(with result: [[SettingsPoint]])
    func getCurrentSettingsPoint(with indexPath: IndexPath) -> SettingsPoint?
    func numberOfRowsInSection(_ section: Int) -> Int
    func numberOfSections() -> Int
    func openAnotherScreen()
    func pushViewController(_ viewController: SettingsViewProtocol)

}

class SettingsAppPresenter: SettingsPresenterProtocol {

    //MARK: - Properties

    var interactor: SettingsInteractorProtocol?
    weak var view: SettingsViewProtocol?
    var router: SettingsRouterProtocol?
    var settingsPoints: [[SettingsPoint]]?

    //MARK: - Functions
    func getStartingData() {
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

    func pushViewController(_ viewController: SettingsViewProtocol) {
        view?.pushViewController(viewController)
    }
}
