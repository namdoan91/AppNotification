//
//  ChangePass.swift
//  AppNotification
//
//  Created by namit on 04/12/2020.
//

import UIKit
import Kingfisher
import SwiftyJSON
import SkyFloatingLabelTextField
import SafariServices

import WebKit

class ProfileVC: UITableViewController, WKNavigationDelegate , SFSafariViewControllerDelegate{
    deinit {
        print("Huỷ ProfileViewController")
    }

    var dataProfile: checkSession!
    var titleName = String()
    var avatarName = String()
    var titleMSNV = String()
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor(red:0.086, green:0.510, blue:0.973, alpha: 1.000),NSAttributedString.Key.font: UIFont(name: "Arial", size: 19)!]
        tableView.register(cellProfile.self, forCellReuseIdentifier: "cellProfile")
        tableView.register(cellPassword.self, forCellReuseIdentifier: "cellPassword")
        tableView.register(cellLogout.self, forCellReuseIdentifier: "cellLogout")
        tableView.register(cellTerms.self, forCellReuseIdentifier: "cellTerms")
        tableView.register(cellManual.self, forCellReuseIdentifier: "cellManual")
        tableView.register(cellComment.self, forCellReuseIdentifier: "cellComment")
        tableView.register(cellSupport.self, forCellReuseIdentifier: "cellSupport")
        tableView.register(cellVersion.self, forCellReuseIdentifier: "cellVersion")
        
        
        
        tableView.separatorStyle = .none
        let longTitleLabel = UILabel()
        longTitleLabel.text = "Tài khoản"
        longTitleLabel.font = UIFont.init(name: "Arial", size: 30)
        longTitleLabel.sizeToFit()
        let leftItem = UIBarButtonItem(customView: longTitleLabel)
        self.navigationItem.leftBarButtonItem = leftItem

        tableView.isScrollEnabled = false
        tableView.backgroundColor = UIColor(red:0.820, green:0.820, blue:0.839, alpha: 1.000)
        DispatchQueue.main.async {
            self.checkSession()
        }
    }
    func checkSession(){
        ApiManager.shared.checkSession { [weak self] (_ data) in
            guard let strongSelf = self else {return}
            strongSelf.dataProfile = data
            strongSelf.titleName = strongSelf.dataProfile.name!
            strongSelf.avatarName = strongSelf.dataProfile.avatar!
            strongSelf.titleMSNV = strongSelf.dataProfile.username!
            strongSelf.tableView.reloadData()
        }failure: { (code) in
            self.showAlert(alertText: code, alertMessage: "Thông Tin Đăng Nhập Lỗi.")
        }
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 8
        
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0{
            let cell = tableView.dequeueReusableCell(withIdentifier: "cellProfile" , for: indexPath) as! cellProfile
            cell.titleNewLabel.text = "Tên NV: \(titleName)"
            cell.avatarTitle.setImage(urlString: avatarName)
            cell.titleMSNV.text = "MSNV: \(titleMSNV)"
            cell.nextImage.tintColor = .black
            cell.backgroundColor = .clear
            return cell
        }else if indexPath.row == 1{
            let cell1 = tableView.dequeueReusableCell(withIdentifier: "cellPassword" , for: indexPath) as! cellPassword
            cell1.nextImage.tintColor = .black
            cell1.avatarTitle.tintColor = UIColor.blue.withAlphaComponent(0.5)
            return cell1
        }else if indexPath.row == 2{
            let cell1 = tableView.dequeueReusableCell(withIdentifier: "cellLogout" , for: indexPath) as! cellLogout
            cell1.nextImage.tintColor = .black
            cell1.avatarTitle.alpha = 0.5
            return cell1
        }else if indexPath.row == 3{
            let cell1 = tableView.dequeueReusableCell(withIdentifier: "cellTerms" , for: indexPath) as! cellTerms
            cell1.nextImage.tintColor = .black
            cell1.avatarTitle.tintColor = UIColor.blue.withAlphaComponent(0.5)
            cell1.backgroundColor = .clear
            return cell1
        }else if indexPath.row == 4{
            let cell1 = tableView.dequeueReusableCell(withIdentifier: "cellManual" , for: indexPath) as! cellManual
            cell1.nextImage.tintColor = .black
            cell1.avatarTitle.tintColor = UIColor.blue.withAlphaComponent(0.5)
            cell1.backgroundColor = .clear
            return cell1
        }else if indexPath.row == 5{
            let cell1 = tableView.dequeueReusableCell(withIdentifier: "cellManual" , for: indexPath) as! cellManual
            cell1.nextImage.tintColor = .black
            cell1.avatarTitle.tintColor = UIColor.blue.withAlphaComponent(0.5)
            cell1.titleNewLabel.text = "Hướng dẫn sử dụng trên điện thoại"
            cell1.backgroundColor = .clear
            return cell1
        }else if indexPath.row == 6{
            let cell1 = tableView.dequeueReusableCell(withIdentifier: "cellSupport" , for: indexPath) as! cellSupport
            cell1.nextImage.tintColor = .black
            cell1.avatarTitle.tintColor = UIColor.blue.withAlphaComponent(0.5)
            cell1.backgroundColor = .clear
            return cell1
        }else{
            let cell1 = tableView.dequeueReusableCell(withIdentifier: "cellVersion" , for: indexPath) as! cellVersion
            cell1.nextImage.tintColor = .black
            cell1.avatarTitle.tintColor = UIColor.blue.withAlphaComponent(0.5)
            cell1.backgroundColor = .clear
            return cell1
        }
    }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.row == 0{
            let profileName = ProfileName()
            navigationController?.pushViewController(profileName, animated: true)
        }
        if indexPath.row == 1{
            let changPassVC = ChangPassVC()
            navigationController?.pushViewController(changPassVC, animated: true)
        }
        if indexPath.row == 2{
            UserDefaults.standard.removeObject(forKey: "session_key")
            HTTPCookieStorage.shared.removeCookies(since: Date.distantPast)
            print("[WebCacheCleaner] All cookies deleted")
            WKWebsiteDataStore.default().fetchDataRecords(ofTypes: WKWebsiteDataStore.allWebsiteDataTypes()) { records in
                records.forEach { record in
                    WKWebsiteDataStore.default().removeData(ofTypes: record.dataTypes, for: [record], completionHandler: {})
                    print("[WebCacheCleaner] Record \(record) deleted")
                }
            }
            let loginVC = LoginVC()
            let window = UIApplication.shared.windows.first
            window?.rootViewController = loginVC
        }

    }
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//        return UITableView.automaticDimension
        return 70
    }

}
