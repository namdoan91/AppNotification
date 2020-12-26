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
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.windowScene = windowScene
     
//        let tabBC = UITabBarController()
        let success = setupController()
        let sessionKey = UserDefaults.standard.string(forKey: "session_key") ?? ""
        print("lưu sessionkey ở scendelegate: \(sessionKey)")
        if !sessionKey.isEmpty{
            window?.rootViewController = success
        }else{
            window?.rootViewController = LoginVC()
        }
        window?.makeKeyAndVisible()
//        window?.rootViewController = loginVC
//        window?.makeKeyAndVisible()
    }
    
    func setupController() ->UITabBarController{
        let tabBC = UITabBarController()
        let homeVC = UINavigationController(rootViewController: HomeVC())
        homeVC.tabBarItem = UITabBarItem(title: "Home", image: UIImage(systemName: "house.fill"), tag: 0)
    
        let profile = UINavigationController(rootViewController: ProfileVC())
        profile.tabBarItem = UITabBarItem(title: "Tài Khoản", image: UIImage(systemName: "gear"), tag: 1)
        tabBC.setViewControllers([homeVC, profile], animated: true)
        tabBC.tabBar.barTintColor = .white
        return tabBC
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
