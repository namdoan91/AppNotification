//
//  Colors.swift
//  AppNotification
//
//  Created by namit on 03/12/2020.
//

import Foundation
import UIKit
extension UIColor {
    func color(_ colorsGra: UIColor){
        var gl:CAGradientLayer = CAGradientLayer()
        let colorTop = UIColor(red: 192.0 / 255.0, green: 38.0 / 255.0, blue: 42.0 / 255.0, alpha: 1.0).cgColor
        let colorBottom = UIColor(red: 35.0 / 255.0, green: 2.0 / 255.0, blue: 2.0 / 255.0, alpha: 1.0).cgColor

        gl = CAGradientLayer()
        gl.colors = [colorTop, colorBottom]
        gl.locations = [0.0, 1.0]
    }
    
}
