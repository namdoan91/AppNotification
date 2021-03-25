//
//  API Manager + login.swift
//  AppNotification
//
//  Created by namit on 11/12/2020.
//

import Foundation
import Alamofire
import SwiftyJSON
import Firebase


extension ApiManager{
    func loginAPP(DangNhap: String, MatKhau: String, success: @escaping () -> Void, failure: @escaping (String) -> Void) {
        let para = ["username" : DangNhap, "password": MatKhau]
        AF.request(APINameManager.shared.returnUrl(APINameManager.shared.login), method: .post, parameters: para, encoding: URLEncoding.default).responseJSON{
            response in
            switch response.result{
            case .success(let value):
                let json = JSON(value)
//                print(json)
                let code = json["CODE"].stringValue
                    if code == "SUCCESS"{
                        let sessionKey = json["session_key"].stringValue
                        let username = json["userData"]["emp_id"].intValue
                        UserDefaults.standard.setValue(sessionKey, forKey: "session_key")
                        print("sesiong_key đã lưu : \(UserDefaults.standard.setValue(sessionKey, forKey: "session_key"))")
                        UserDefaults.standard.setValue(username, forKey: "username")
//                        print("username: \(UserDefaults.standard.setValue(username, forKey: "username"))")
//                        UserDefaults.standard.string(forKey: "username")
                        UIApplication.shared.registerForRemoteNotifications()
                        Messaging.messaging().subscribe(toTopic: "\(username)")
                        Messaging.messaging().subscribe(toTopic: "ALL")
//                        print("username đã lưu : \(UserDefaults.standard.string(forKey: "username") ?? "")")
                        success()
                    }else{
                        let message = json["CODE"].stringValue
                        failure(message)
                    }
            case .failure(let err):
                print(err.localizedDescription)
            }
        }
    }
}
