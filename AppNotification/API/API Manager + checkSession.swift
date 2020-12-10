//
//  API Manager + checkSession.swift
//  AppNotification
//
//  Created by namit on 10/12/2020.
//

import Foundation
import Alamofire
import SwiftyJSON

extension ApiManager{
    func checkSession(success: @escaping (checkSession?) -> Void, failure: @escaping (String) -> Void){
        let sessionKey = UserDefaults.standard.string(forKey: "session_key") ?? ""
        let par = ["session_key" : sessionKey]
        AF.request(APINameManager.shared.returnUrl(APINameManager.shared.checkSession), method: .post, parameters: par, encoding: URLEncoding.default).responseJSON{
            response in
            switch response.result{
            case .success(let object):
                let json = JSON(object)
                if json["CODE"].stringValue == "SUCCESS"{
                    let data = AppNotification.checkSession(json: json["userData"])
                    success(data)
                }else{
                    let message = json["CODE"].stringValue
                    failure(message)
                    DispatchQueue.main.async{
                        UserDefaults.standard.removeObject(forKey: "session_key")
                        let loginVC = LoginVC()
                        let window = UIApplication.shared.windows.first
                        window?.rootViewController = loginVC
                    }
                }
            case .failure(let err):
                print(err.localizedDescription)
            }
        }
    }
}
