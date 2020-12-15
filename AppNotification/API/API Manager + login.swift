//
//  API Manager + login.swift
//  AppNotification
//
//  Created by namit on 11/12/2020.
//

import Foundation
import Alamofire
import SwiftyJSON

extension ApiManager{
    func loginAPP(DangNhap: String, MatKhau: String, success: @escaping () -> Void, failure: @escaping (String) -> Void) {
        let para = ["username" : DangNhap, "password": MatKhau]
        AF.request(APINameManager.shared.returnUrl(APINameManager.shared.login), method: .post, parameters: para, encoding: URLEncoding.default).responseJSON{
            response in
            switch response.result{
            case .success(let value):
                let json = JSON(value)
                let code = json["CODE"].stringValue
                    if code == "SUCCESS"{
                    let sessionKey = json["session_key"].stringValue
                    UserDefaults.standard.setValue(sessionKey, forKey: "session_key")
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
