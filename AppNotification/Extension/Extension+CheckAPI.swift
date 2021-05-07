//
//  Extension+CheckAPI.swift
//  AppNotification
//
//  Created by namitMacOs on 30/03/2021.
//

import Foundation
import UIKit

extension UIViewController{
    static var checkSeSSion: checkSession!

    func checkAPI(){
        ApiManager.shared.checkSession {(_ data) in
            UIViewController.checkSeSSion = data
            var imageURL: String
            imageURL = APINameManager.shared.avatar + UIViewController.checkSeSSion.avatar!
            UserDefaults.standard.setValue(imageURL, forKey: "imageURL")
        }failure: { (code) in
            self.showAlert(alertText: code, alertMessage: "Thông Tin Đăng Nhập Lỗi.")
        }
    }
}
