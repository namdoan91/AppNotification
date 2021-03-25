//
//  APINamManager.swift
//  AppNotification
//
//  Created by namit on 10/12/2020.
//

import Foundation


class APINameManager {
    static let shared = APINameManager()
    init(){
    }
    let domain = "https://id.mvpapp.vn/api/v1"
//    let domain = "http://35.220.251.3/api/v1"
//    let avatar = "http://35.220.251.3/"
    let avatar = "https://id.mvpapp.vn/"
    let login = "/system/Login"
    let getNotify = "/mvpnotify/getNotification"
    let checkSession = "/system/checkSession"
    let changePassword = "/system/changePassword"
    func returnUrl(_ nameRequest: String) -> String{
        return domain + nameRequest
    }
}
