//
//  UIAlert.swift
//  AppNotification
//
//  Created by namit on 03/12/2020.
//

import Foundation
import UIKit

extension UIViewController {
func showAlert(alertText : String, alertMessage : String) {
    let alert = UIAlertController(title: alertText, message: alertMessage, preferredStyle: .alert)
    alert.addAction(UIAlertAction(title: "Quay Lại", style: .default, handler: nil))
self.present(alert, animated: true, completion: nil)
  }
}


