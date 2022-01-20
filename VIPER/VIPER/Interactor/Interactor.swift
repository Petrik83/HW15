//
//  Interactor.swift
//  VIPER
//
//  Created by Дмитрий Казанков on 02.01.2022.
//

import Foundation

protocol SettingsInteractorProtocol: AnyObject {
    var presenter: SettingsPresenterProtocol? { get set }

    func getSettingsPoints()
}

class SettingsAppInteractor: SettingsInteractorProtocol {
    weak var presenter: SettingsPresenterProtocol?

    func getSettingsPoints() {
        let entities = SettingsPoint.getSettingPoints()
        self.presenter?.interactorDidFetchSettingsPoints(with: entities)
    }

}
