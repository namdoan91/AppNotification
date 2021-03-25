//
//  API Manager + getNotify.swift
//  AppNotification
//
//  Created by namit on 10/12/2020.
//

import Foundation
import Alamofire
import SwiftyJSON


extension ApiManager{
    
    func getNotify(success: @escaping (getNotify?) -> Void, failure: @escaping (String) -> Void){
        let sessionKey = UserDefaults.standard.string(forKey: "session_key") ?? ""
        let par = ["session_key" : sessionKey]
        AF.request(APINameManager.shared.returnUrl(APINameManager.shared.getNotify), method: .post, parameters: par).responseJSON{
            response in
            switch response.result{
            case .success(let value):
                let json = JSON(value)
                let code = json["CODE"].stringValue
                if code == "SUCCESS"{
                    for item in json["notification"].arrayValue{
                        let getNotification = AppNotification.getNotify(json: JSON(item))
                        success(getNotification)
                    }
                }else{
                    let message = json["CODE"].stringValue
                    failure(message)
                }
            case .failure(let error):
                failure(error.localizedDescription)
                failure("Lỗi: \(error.localizedDescription)")
            }
        }
    }
}

