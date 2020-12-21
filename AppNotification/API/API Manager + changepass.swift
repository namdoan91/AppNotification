//
//  API Manager + changepass.swift
//  AppNotification
//
//  Created by namit on 21/12/2020.
//

import Foundation
import UIKit
import Alamofire
import SwiftyJSON

extension ApiManager{
    func changPass(password_OLD: String, password_NEW: String,success: @escaping () -> Void, failure: @escaping (String) -> Void){
        let sessionKey = UserDefaults.standard.string(forKey: "session_key") ?? ""
        let par = ["session_key" : sessionKey, "password_old" : password_OLD , "password_new" : password_NEW]
        AF.request(APINameManager.shared.returnUrl(APINameManager.shared.changePassword), method: .post, parameters: par, encoding: URLEncoding.default).responseJSON{
            response in
            switch response.result{
            case .success(let object):
                let json = JSON(object)
                if json["CODE"].stringValue == "SUCCESS"{
                    success()
                }else{
                    let message = json["CODE"].stringValue
                    failure(message)
//                    DispatchQueue.main.async{
//                        UserDefaults.standard.removeObject(forKey: "session_key")
//                        let loginVC = LoginVC()
//                        let window = UIApplication.shared.windows.first
//                        window?.rootViewController = loginVC
//                    }
                }
            case .failure(let err):
                print(err.localizedDescription)
            }
        }
    }
}

