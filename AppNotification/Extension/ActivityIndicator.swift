//
//  ActivityIndicator.swift
//  AppNotification
//
//  Created by namit on 17/12/2020.
//

import Foundation
import UIKit
import EZProgressHUD


extension UIViewController {
    func hub(_ hud:UIView) {
    let options = EZProgressOptions { (option) in

        option.radius = 115                                                                               // by default is 115
        option.firstLayerStrokeColor = UIColor(red: 10/255, green: 101/255, blue: 171/255, alpha: 1.0)    // by default is UIColor(red: 220/255, green: 20/255, blue: 60/255, alpha: 1)
        option.secondLayerStrokeColor = UIColor(red: 10/255, green: 101/255, blue: 171/255, alpha: 1.0)   // by default is UIColor(red: 220/255, green: 20/255, blue: 60/255, alpha: 1), FYI it's always transparent ;)
        option.thirdLayerStrokeColor = .gray                                                              // by default is .gray
        option.strokeWidth = 2                                                                            // by default is 12.0
        option.font = UIFont(name: "Papyrus", size: 18)!                                                  // by default is Papyrus size 18
        option.title = "EZProgressHUD"                                                                    // by default is "Please Wait..."
        option.titleTextColor = .white                                                                    // by default is white
        option.transViewBackgroundColor = .black                                                          // by default is black
        option.animationOption = EZAnimationOptions.hnk                                                   // by default is EZAnimationOptions.heartBeat
    }
    let hud = EZProgressHUD.setProgress(with: options)
        hud.show()
        hud.dismiss(completion: nil)
  }
}
