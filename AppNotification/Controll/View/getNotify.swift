//
//  File.swift
//  AppNotification
//
//  Created by namit on 10/12/2020.
//

import Foundation
import SwiftyJSON

class getNotify {

    let id: Int?
    let code: String?
    let title: String?
    let messege: String?
    let link: String?
    let isSeen: String?
    let createdAt: String?
    let updatedAt: String?
    let createdAtFormat: String?

    required public init?(json: JSON) {
        id = json["id"].intValue
        code = json["code"].stringValue
        title = json["title"].stringValue
        messege = json["message"].stringValue
        link = json["link"].stringValue
        isSeen = json["is_seen"].stringValue
        createdAt = json["created_at"].stringValue
        updatedAt = json["updated_at"].stringValue
        createdAtFormat = json["created_at_format"].stringValue
    }
    
}
