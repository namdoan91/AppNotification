//
//  AppDelegate.swift
//  AppNotification
//
//  Created by namit on 03/12/2020.
//

import UIKit
import Firebase
import UserNotifications
import FirebaseMessaging
import FirebaseInAppMessaging


@main
class AppDelegate: UIResponder, UIApplicationDelegate, UNUserNotificationCenterDelegate, MessagingDelegate{
    var window: UIWindow?
    static var shared: AppDelegate {return UIApplication.shared.delegate as! AppDelegate}
    

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
        UINavigationBar.appearance().backgroundColor = .clear
        // Set translucent. (Default value is already true, so this can be removed if desired.)
        UINavigationBar.appearance().isTranslucent = true
        
        FirebaseApp.configure()
        Messaging.messaging().delegate = self //Nhận các message từ FirebaseMessaging
        configApplePush(application)
        return true
    }
    func configApplePush(_ application: UIApplication) {
            if #available(iOS 10.0, *) {
                UNUserNotificationCenter.current().delegate = self
                let authOptions: UNAuthorizationOptions = [.alert, .badge, .sound]
                UNUserNotificationCenter.current().requestAuthorization(
                    options: authOptions,
                    completionHandler: {_, _ in })
            } else {
                let settings: UIUserNotificationSettings =
                    UIUserNotificationSettings(types: [.alert, .badge, .sound], categories: nil)
                application.registerUserNotificationSettings(settings)
            }
            application.registerForRemoteNotifications()
            if let token = Messaging.messaging().fcmToken {
                print("FCM token: \(token)")
//                UserDefaults.standard.setValue(token, forKey: "fcmToken")
//                print("token fcm ở app delegate: \(UserDefaults.standard.setValue(token, forKey: "fcmToken"))")
//                AppSession.shared.setFirebaseToken(token)
            }
        }
    func applicationWillResignActive(_ application: UIApplication) {
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
    }

    func applicationWillEnterForeground(_ application: UIApplication) {

    }

    func applicationDidBecomeActive(_ application: UIApplication) {
    }

    func applicationWillTerminate(_ application: UIApplication) {
    }

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
    func application(_ application: UIApplication, didRegisterForRemoteNotificationsWithDeviceToken deviceToken: Data) {
        Messaging.messaging().apnsToken = deviceToken
        print("APNs token retrieved: \(deviceToken)")
//        let username = UserDefaults.standard.string(forKey: "username") ?? ""
//        Messaging.messaging().subscribe(toTopic: "\(username)")
//        print("username ở Appdelegate: \(username)")
//        print("đã subscribe \(Messaging.messaging().subscribe(toTopic: "\(username)"))")

    }
    func messaging(_ messaging: Messaging, didReceiveRegistrationToken fcmToken: String?) {
           //Nhận được fcmToken,lưu lại và gửi lên back-end khi làm app thực tế
        let dataDict:[String: String] = ["token": fcmToken ?? ""]
          NotificationCenter.default.post(name: Notification.Name("FCMToken"), object: nil, userInfo: dataDict)
          // TODO: If necessary send token to application server.
          // Note: This callback is fired at each app startup and whenever a new token is generated.
    }
       
    func messaging(_ messaging: Messaging, didRefreshRegistrationToken fcmToken: String) {
           //Nhận được fcmToken,lưu lại và gửi lên back-end khi làm app thực tế
//        let dataDict:[String: String] = ["token": fcmToken ]
//          NotificationCenter.default.post(name: Notification.Name("FCMToken"), object: nil, userInfo: dataDict)
        
    }

    func application(_ application: UIApplication, didReceiveRemoteNotification userInfo: [AnyHashable: Any]) {
            if let messageID = userInfo["gcm.message_id"] {
                print("Message ID: \(messageID)")
            }

            let message : [String : Any] = userInfo["aps"] as! [String : Any]
            let messageAlert : [String : Any] = message["alert"] as! [String : Any]
            let lBody : String = messageAlert["body"] as! String
            let lTitle : String = messageAlert["title"] as! String

            print("body 1 = \(lBody)") //this works!
            print("title = \(lTitle)") //this works!

            let alert = UIAlertController(title:  lTitle, message: lBody, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            self.window?.rootViewController?.present(alert, animated: true, completion: nil)
    }

    func application(_ application: UIApplication, didReceiveRemoteNotification userInfo: [AnyHashable: Any],
                         fetchCompletionHandler completionHandler: @escaping (UIBackgroundFetchResult) -> Void) {

            let message : [String : Any] = userInfo["aps"] as! [String : Any]
            let messageAlert : [String : Any] = message["alert"] as! [String : Any]
            let lBody : String = messageAlert["body"] as! String
            let lTitle : String = messageAlert["title"] as! String

            print("body 2 = \(lBody)")
            print("title = \(lTitle)")

          let alert = UIAlertController(title:  lTitle, message: lBody, preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            self.window?.rootViewController?.present(alert, animated: true, completion: nil)
            completionHandler(UIBackgroundFetchResult.newData)
    }
    func application(_ application: UIApplication, didFailToRegisterForRemoteNotificationsWithError error: Error) {
            print("Unable to register for remote notifications: \(error.localizedDescription)")
    }
    func userNotificationCenter(_ center: UNUserNotificationCenter,
                                    willPresent notification: UNNotification,
                                    withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
            let userInfo = notification.request.content.userInfo

            let message : [String : Any] = userInfo["aps"] as! [String : Any]
            let messageAlert : [String : Any] = message["alert"] as! [String : Any]
            let lBody : String = messageAlert["body"] as! String
            let lTitle : String = messageAlert["title"] as! String

            print("body 3 = \(lBody)")
            print("title = \(lTitle)")

            let alert = UIAlertController(title:  lTitle, message: lBody, preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            self.window?.rootViewController?.present(alert, animated: true, completion: nil)

            completionHandler([UNNotificationPresentationOptions.alert])
    }

    func userNotificationCenter(_ center: UNUserNotificationCenter,
                                    didReceive response: UNNotificationResponse,
                                    withCompletionHandler completionHandler: @escaping () -> Void) {
            let userInfo = response.notification.request.content.userInfo
            if let messageID = userInfo["gcm.message_id"] {
                print("Message ID: \(messageID)") //can use the id later to privent multiple popups of the same message
            }

            let message : [String : Any] = userInfo["aps"] as! [String : Any]
            let messageAlert : [String : Any] = message["alert"] as! [String : Any]
            let lBody : String = messageAlert["body"] as! String
            let lTitle : String = messageAlert["title"] as! String

            print("body 4 = \(lBody)")
            print("title = \(lTitle)")

            let alert = UIAlertController(title:  lTitle, message: lBody, preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
                self.window?.rootViewController?.presentedViewController?.present(alert, animated: true, completion: nil)

            completionHandler()
    }

}

        

