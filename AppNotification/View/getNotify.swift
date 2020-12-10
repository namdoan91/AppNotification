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
    let empId: Int?
    let title: String?
    let content: String?
    let link: String?
    let isSeen: Int?
    let createdAt: String?
    let updatedAt: String?
    let createdAtFormat: String?

    required public init?(json: JSON) {
        id = json["id"].intValue
        empId = json["emp_id"].intValue
        title = json["title"].stringValue
        content = json["content"].stringValue
        link = json["link"].stringValue
        isSeen = json["is_seen"].intValue
        createdAt = json["created_at"].stringValue
        updatedAt = json["updated_at"].stringValue
        createdAtFormat = json["created_at_format"].stringValue
    }

}
