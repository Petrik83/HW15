//
//  SceneDelegate.swift
//  VIPER
//
//  Created by Дмитрий Казанков on 02.01.2022.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }

        let settingsAppRouter = SettingsAppRouter.start()
        let initialViewController = settingsAppRouter.presenter?.view as? UIViewController

        let navigationController = UINavigationController(rootViewController: initialViewController ?? UIViewController())

        let window = UIWindow(windowScene: windowScene)
        window.rootViewController = navigationController
        self.window = window
        window.makeKeyAndVisible()
    }

}

