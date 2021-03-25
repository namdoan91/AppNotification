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
import FirebaseMessaging
import SVProgressHUD
import WebKit

class ProfileVC: UITableViewController, WKNavigationDelegate , MessagingDelegate{
    deinit {
        print("Huỷ ProfileViewController")
    }

    var dataProfile: checkSession!
    var titleName = String()
    var avatarName = String()
    var titleMSNV = String()
    let groups = ["TaiKhoan", "SignInOut", "Support"]
    let items = [
        ["Tai Khoan"],
        ["Đổi mật khẩu", "Đăng xuất"],
        ["Chính sách và Điều khoản", "Hướng dẫn sử dụng" ,"Hỗ trợ", "Đóng góp ý kiến", "Phiên bản"]
    ]
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor(red:0.086, green:0.510, blue:0.973, alpha: 1.000),NSAttributedString.Key.font: UIFont(name: "Arial", size: 30)!]
        tableView.register(cellProfile.self, forCellReuseIdentifier: "cellProfile")
        tableView.register(cellPassword.self, forCellReuseIdentifier: "cellPassword")
        tableView.separatorStyle = .none
        tableView.isScrollEnabled = true
//        tableView.backgroundColor = UIColor(red:0.820, green:0.820, blue:0.839, alpha: 1.000)
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
            let longTitleLabel = UILabel()
            longTitleLabel.text = "MSNV:"
            longTitleLabel.font = UIFont.init(name: "Arial", size: 30)
            longTitleLabel.sizeToFit()
            let leftItem1 = UIBarButtonItem(customView: longTitleLabel)
            let longMSNVTitleLabel = UILabel()
            longMSNVTitleLabel.text = strongSelf.titleMSNV
            longMSNVTitleLabel.font = UIFont.init(name: "Arial", size: 30)
            longMSNVTitleLabel.textColor = .blue
            longMSNVTitleLabel.sizeToFit()
            let leftItem2 = UIBarButtonItem(customView: longMSNVTitleLabel)
            strongSelf.navigationItem.leftBarButtonItems = [leftItem1,leftItem2 ]
        }failure: { (code) in
            self.showAlert(alertText: code, alertMessage: "Thông Tin Đăng Nhập Lỗi.")
        }
    }
    override func numberOfSections(in tableView: UITableView) -> Int {
        return groups.count
    }
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 40
    }
    override func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        return nil;
    }
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        return nil;
    }
    override func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return .leastNormalMagnitude
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items[section].count
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let layer = CAGradientLayer()
        layer.frame = CGRect(x: 0, y: 0, width: 50, height: 50)
        if indexPath.section == 0{
            let cell = tableView.dequeueReusableCell(withIdentifier: "cellProfile" , for: indexPath) as! cellProfile
            cell.titleNewLabel.text = titleName
            cell.avatarTitle.setImage(urlString: avatarName)
            cell.nextImage.tintColor = .black
            cell.backgroundColor = .white
            cell.layer.cornerRadius = 15
            return cell
        }
        if indexPath.section == 1{
            let cell1 = tableView.dequeueReusableCell(withIdentifier: "cellPassword" , for: indexPath) as! cellPassword
            cell1.nextImage.tintColor = .black
            let seperatorView = UIView.init(frame: CGRect(x: 70, y: cell1.frame.size.height, width: cell1.frame.size.width - 90, height: 1))
            seperatorView.backgroundColor = UIColor.lightGray.withAlphaComponent(0.2)
            cell1.selectionStyle = .none
            if indexPath.row == 0{
                cell1.avatarTitle.image = UIImage(systemName: "lock.fill")
                cell1.avatarTitle.tintColor = UIColor.white
                layer.colors = [UIColor(red: 0.635, green: 0.867, blue: 0.314, alpha: 1).cgColor, UIColor(red: 0, green: 0.639, blue: 0.247, alpha: 1).cgColor]
                cell1.viewUI.layer.insertSublayer(layer, at: 0)
                cell1.containerView.addSubview(seperatorView)
            }else{
                cell1.avatarTitle.image = UIImage(systemName: "power")
                cell1.avatarTitle.contentMode = .scaleToFill
                cell1.avatarTitle.tintColor = UIColor.white
                layer.colors = [UIColor(red: 0.431, green: 0.675, blue: 0.875, alpha: 1).cgColor, UIColor(red: 0.141, green: 0.247, blue: 0.463, alpha: 1).cgColor]
                cell1.viewUI.layer.insertSublayer(layer, at: 0)
            }
            cell1.titleNewLabel.text = items[indexPath.section][indexPath.row]
            return cell1
        }
        else{
            let cell1 = tableView.dequeueReusableCell(withIdentifier: "cellPassword" , for: indexPath) as! cellPassword
            let seperatorView = UIView.init(frame: CGRect(x: 70, y: cell1.frame.size.height, width: cell1.frame.size.width - 90, height: 1))
            seperatorView.backgroundColor = UIColor.lightGray.withAlphaComponent(0.2)
            cell1.selectionStyle = .none
            cell1.nextImage.tintColor = .black
            if indexPath.row == 0{
                cell1.avatarTitle.image = UIImage(systemName: "checkmark.shield.fill")
                cell1.avatarTitle.tintColor = UIColor.white
                layer.colors = [UIColor(red: 1, green: 0.494, blue: 0.482, alpha: 1).cgColor, UIColor(red: 1, green: 0.204, blue: 0, alpha: 1).cgColor]
                cell1.viewUI.layer.insertSublayer(layer, at: 0)
                cell1.containerView.addSubview(seperatorView)
            }else if indexPath.row == 1{
                cell1.avatarTitle.image = UIImage(systemName: "book.fill")
                cell1.avatarTitle.frame = CGRect(x: 10, y: 15, width: 30, height: 20)
                cell1.avatarTitle.tintColor = UIColor.white
                layer.colors = [UIColor(red: 1, green: 0.725, blue: 0.200, alpha: 1).cgColor, UIColor(red: 0.976, green: 0.408, blue: 0.114, alpha: 1).cgColor]
                cell1.viewUI.layer.insertSublayer(layer, at: 0)
                cell1.containerView.addSubview(seperatorView)
            }else if indexPath.row == 2{
                cell1.avatarTitle.image = UIImage(systemName: "bubble.left.and.bubble.right.fill")
                cell1.avatarTitle.frame = CGRect(x: 10, y: 15, width: 30, height: 20)
                cell1.avatarTitle.tintColor = UIColor.white
                layer.colors = [UIColor(red: 0.525, green: 1, blue: 0.608, alpha: 1).cgColor,UIColor(red: 0.012, green: 0.714, blue: 0.129, alpha: 1).cgColor]
                cell1.viewUI.layer.insertSublayer(layer, at: 3)
                cell1.containerView.addSubview(seperatorView)
            }else if indexPath.row == 3{
                cell1.avatarTitle.image = UIImage(systemName: "envelope.fill")
                cell1.avatarTitle.frame = CGRect(x: 10, y: 15, width: 30, height: 20)
                cell1.avatarTitle.tintColor = UIColor.white
                layer.colors = [UIColor(red: 0.114, green: 0.455, blue: 0.949, alpha: 1).cgColor, UIColor(red: 0.102, green: 0.753, blue: 0.980, alpha: 1).cgColor]
                cell1.viewUI.layer.insertSublayer(layer, at: 3)
                cell1.containerView.addSubview(seperatorView)
            }else{
                cell1.avatarTitle.image = UIImage(systemName: "info.circle.fill")
                cell1.avatarTitle.tintColor = UIColor.white
                layer.colors = [UIColor(red: 0.890, green: 0.471, blue: 0.667, alpha: 1).cgColor, UIColor(red: 0.624, green: 0.192, blue: 0.455, alpha: 1).cgColor]
                cell1.viewUI.layer.insertSublayer(layer, at: 3)
            }
            cell1.titleNewLabel.text = items[indexPath.section][indexPath.row]
            return cell1
        }
    }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.section == 0 && indexPath.row == 0{
            navigationController?.pushViewController(ProfileName(), animated: true)
        }
        if indexPath.section == 1 && indexPath.row == 0{
            navigationController?.pushViewController(ChangPassVC(), animated: true)
        }else if indexPath.section == 1 && indexPath.row == 1{
            UserDefaults.standard.removeObject(forKey: "session_key")
            //            UserDefaults.standard.removeObject(forKey: "username")
            let username = UserDefaults.standard.string(forKey: "username") ?? ""
//            print("topic profilevc: \(UserDefaults.standard.string(forKey: "username") ?? "")")
            UIApplication.shared.unregisterForRemoteNotifications()
            Messaging.messaging().unsubscribe(fromTopic: "\(username)")
            SVProgressHUD.dismiss()
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
        
        if indexPath.section == 2 && indexPath.row == 0{
            navigationController?.pushViewController(TermsVC(), animated: true)
        }else if indexPath.row == 1{
            navigationController?.pushViewController(UserGuideVC(), animated: true)
        }else if indexPath.row == 2{
            navigationController?.pushViewController(SupportVC(), animated: true)
        }else if indexPath.row == 3{
            navigationController?.pushViewController(SupportVC(), animated: true)
        }else if indexPath.row == 4{
            navigationController?.pushViewController(VersionVC(), animated: true)
        }else{
            return
        }
    }
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//        return UITableView.automaticDimension
        return 60
    }
    override func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        let header = view as! UITableViewHeaderFooterView
        header.textLabel?.textColor = UIColor.black
        if section == 0{
            header.textLabel?.text = "Tài Khoản"
        } else if section == 1 {
            header.textLabel?.text = "Cài Đặt"
        }else {
            header.textLabel?.text = "Điều Khoản và Trợ Giúp"
        }
        
    }
}
