//
//  Extension + UIImageView.swift
//  AppNotification
//
//  Created by namit on 10/12/2020.
//

import Foundation
import UIKit
import Kingfisher

extension UIImageView{
    func setImage(urlString: String){
        var string = ""
        string = APINameManager.shared.avatar + urlString
        let url = URL(string: string)
        self.kf.indicatorType = .activity
        self.kf.setImage(with: url)
    }
    
}


