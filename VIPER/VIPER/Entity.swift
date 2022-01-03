//
//  Entity.swift
//  VIPER
//
//  Created by Дмитрий Казанков on 02.01.2022.
//

import Foundation

//Model

struct SettingsPoint {
    let name: String

    static func getSettingPoints() -> [SettingsPoint] {
        return [
            SettingsPoint(name: "Авиарежим"),
            SettingsPoint(name: "Wi-fi"),
            SettingsPoint(name: "Bluetooth")
        ]
    }
}
