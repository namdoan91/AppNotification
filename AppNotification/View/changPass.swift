//
//  changPass.swift
//  AppNotification
//
//  Created by namit on 21/12/2020.
//

import Foundation
import SwiftyJSON

class changPass{
    let CODE: String?
    let message: String?
    
    required public init?(json: JSON) {
        CODE = json["CODE"].stringValue
        message = json["message"].stringValue
    }
}
