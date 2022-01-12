//
//  Interactor.swift
//  VIPER
//
//  Created by Дмитрий Казанков on 02.01.2022.
//

import Foundation

//object
//protocol
//ref to presenter

protocol AnyInteractor {
    var presenter: AnyPresenter? { get set }

    func getSettingsPoints()
}

class SettingsAppInteractor: AnyInteractor {
    var presenter: AnyPresenter?

    func getSettingsPoints() {
        let entities = SettingsPoint.getSettingPoints()
        self.presenter?.interactorDidFetchSettingsPoints(with: entities)
    }

}
