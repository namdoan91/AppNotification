//
//  SceneDelegate.swift
//  AppNotification
//
//  Created by namit on 03/12/2020.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        window = UIWindow(frame: windowScene.screen.bounds)
        window?.windowScene = windowScene
        let loginVC = LoginVC()
        let homeVC = HomeVC()
        let sessionKey = UserDefaults.standard.string(forKey: "session_key") ?? ""
        let navigationController = UINavigationController(rootViewController: homeVC)
        if !sessionKey.isEmpty{
            window?.rootViewController = navigationController
        }else{
            window?.rootViewController = loginVC
        }
        window?.makeKeyAndVisible()
    }

    func sceneDidDisconnect(_ scene: UIScene) {
    }
    func sceneDidBecomeActive(_ scene: UIScene) {
    }

    func sceneWillResignActive(_ scene: UIScene) {
    }

    func sceneWillEnterForeground(_ scene: UIScene) {
    }
    func sceneDidEnterBackground(_ scene: UIScene) {
    }
}
