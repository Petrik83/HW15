//
//  Entity.swift
//  VIPER
//
//  Created by Дмитрий Казанков on 02.01.2022.
//

import Foundation

//Model

struct SettingsPoint {
    let label: String
    let iconImageName: String
    let backgroundColorName: String
    let needForSwitch: Bool
    let detailLabel: String?
}

extension SettingsPoint {
    static func getSettingPoints() -> [[SettingsPoint]] {
        return [[
            SettingsPoint(label: "Авиарежим",
                          iconImageName: "airplane",
                          backgroundColorName: "systemOrange",
                          needForSwitch: true,
                          detailLabel: nil),
            SettingsPoint(label: "Wi-fi",
                          iconImageName: "wifi",
                          backgroundColorName: "systemBlue",
                          needForSwitch: false,
                          detailLabel: "Не подключено"),
            SettingsPoint(label: "Bluetooth",
                          iconImageName: "bluetooth",
                          backgroundColorName: "systemBlue",
                          needForSwitch: false,
                          detailLabel: "Вкл."),
            SettingsPoint(label: "Сотовая связь",
                          iconImageName: "antenna.radiowaves.left.and.right",
                          backgroundColorName: "systemGreen",
                          needForSwitch: false,
                          detailLabel: nil),
            SettingsPoint(label: "Режим модема",
                          iconImageName: "personalhotspot",
                          backgroundColorName: "systemGreen",
                          needForSwitch: false,
                          detailLabel: nil)
        ], [
            SettingsPoint(label: "Уведомления",
                          iconImageName: "bell.badge.fill",
                          backgroundColorName: "systemRed",
                          needForSwitch: false,
                          detailLabel: nil),
            SettingsPoint(label: "Звуки, тактильные сигналы",
                          iconImageName: "speaker.wave.3.fill",
                          backgroundColorName: "systemRed",
                          needForSwitch: false,
                          detailLabel: nil),
            SettingsPoint(label: "Не беспокоить",
                          iconImageName: "moon.fill",
                          backgroundColorName: "systemPurple",
                          needForSwitch: false,
                          detailLabel: nil),
            SettingsPoint(label: "Экранное время",
                          iconImageName: "hourglass",
                          backgroundColorName: "systemPurple",
                          needForSwitch: false,
                          detailLabel: nil)
        ], [
            SettingsPoint(label: "Основные",
                          iconImageName: "gear",
                          backgroundColorName: "systemGray",
                          needForSwitch: false,
                          detailLabel: nil),
            SettingsPoint(label: "Пункт управления",
                          iconImageName: "switch.2",
                          backgroundColorName: "systemGray",
                          needForSwitch: false,
                          detailLabel: nil),
            SettingsPoint(label: "Экран и яркость",
                          iconImageName: "textformat.size",
                          backgroundColorName: "systemPurple",
                          needForSwitch: false,
                          detailLabel: nil)
        ]]
    }
}
