//
//  UserData.swift
//  AppNotification
//
//  Created by namit on 03/12/2020.
//

import Foundation
import SwiftyJSON

class UserData {

    var id: Int?
    var userGroupId: Int?
    var userGroupLevel: Int?
    var adminLevel: Int?
    var empId: Int?
    var name: String?
    var position: String?
    var teamId: Int?
    var teamCode: String?
    var teamNameVi: String?
    var teamNameEn: String?
    var teamNameJp: String?
    var teamRoleString: String?
    var username: String?
    var email: String?
    var phone: String?
    var avatar: String?
    var pregnancy: Int?
    var status: Int?
    var createdAt: String?
    var updatedAt: String?

    required public init?(json: JSON) {
        id = json["id"].intValue
        userGroupId = json["user_group_id"].intValue
        userGroupLevel = json["user_group_level"].intValue
        adminLevel = json["admin_level"].intValue
        empId = json["emp_id"].intValue
        name = json["name"].stringValue
        position = json["position"].stringValue
        teamId = json["team_id"].intValue
        teamCode = json["team_code"].stringValue
        teamNameVi = json["team_name_vi"].stringValue
        teamNameEn = json["team_name_en"].stringValue
        teamNameJp = json["team_name_jp"].stringValue
        teamRoleString = json["team_role_string"].stringValue
        username = json["username"].stringValue
        email = json["email"].stringValue
        phone = json["phone"].stringValue
        avatar = json["avatar"].stringValue
        pregnancy = json["pregnancy"].intValue
        status = json["status"].intValue
        createdAt = json["created_at"].stringValue
        updatedAt = json["updated_at"].stringValue
    }

}
