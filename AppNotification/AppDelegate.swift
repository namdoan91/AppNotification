//
//  AppDelegate.swift
//  AppNotification
//
//  Created by namit on 03/12/2020.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate{



    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        //set color title vs item uitabbar
        UITabBar.appearance().tintColor = UIColor(red:0.384, green:0.431, blue:0.831, alpha: 1.000)
        let attrSelected = [NSAttributedString.Key.foregroundColor: UIColor(red:0.384, green:0.431, blue:0.831, alpha: 1.000), NSAttributedString.Key.font : UIFont(name: "Arial", size: 30)!]
        UITabBarItem.appearance().setTitleTextAttributes(attrSelected,for: .selected)
        UITabBarItem.appearance().setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor.lightGray], for: .normal)
        // Sets background to a blank/empty image
        UINavigationBar.appearance().setBackgroundImage(UIImage(), for: .default)
        // Sets shadow (line below the bar) to a blank image
        UINavigationBar.appearance().shadowImage = UIImage()
        // Sets the translucent background color
        UINavigationBar.appearance().backgroundColor = .white
        // Set translucent. (Default value is already true, so this can be removed if desired.)
        UINavigationBar.appearance().isTranslucent = false
        
        //set notification
//        UNUserNotificationCenter.current()
//            .requestAuthorization(options: [.alert, .sound, .badge]) {(granted, error) in
//                // Make sure permission to receive push notifications is granted
//                print("Permission is granted: \(granted)")
//        }
//        UNUserNotificationCenter.current().delegate = self
        
        return true
    }
//    func userNotificationCenter(_ center: UNUserNotificationCenter,
//                                willPresent notification: UNNotification,
//                                withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
//        print("Push notification received in foreground.")
//        completionHandler([.sound, .badge])
//    }
//    func getNotificationSettings() {
//      UNUserNotificationCenter.current().getNotificationSettings { (settings) in
//        print("Notification settings: (settings)")
//        guard settings.authorizationStatus == .authorized else { return }
//            UIApplication.shared.registerForRemoteNotifications()
//      }
//    }
//    func registerForPushNotifications() {
//      UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .sound, .badge]) {
//        (granted, error) in
//        print("Permission granted: (granted)")
//
//        guard granted else { return }
//        self.getNotificationSettings()
//      }
//    }
//    func application(_ application: UIApplication,
//                     didRegisterForRemoteNotificationsWithDeviceToken deviceToken: Data) {
//      let tokenParts = deviceToken.map { data -> String in
//        return String(format: "%02.2hhx", data)
//      }
//        let token = tokenParts.joined()
//      print("Device Token: \(token)")
//    }
//
//    func application(_ application: UIApplication,
//                     didFailToRegisterForRemoteNotificationsWithError error: Error) {
//      print("Failed to register: (error)")
//    }

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }


}

