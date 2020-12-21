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
        tableView.register(cellSupport.self, forCellReuseIdentifier: "cellSupport")
        
        
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
    func safariViewControllerDidFinish() {
        dismiss(animated: true)
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
            cell1.avatarTitle.image = UIImage(systemName: "lock.fill")
            cell1.avatarTitle.tintColor = UIColor.blue.withAlphaComponent(0.5)
            cell1.backgroundColor = .clear
            return cell1
        }else if indexPath.row == 2{
            let cell1 = tableView.dequeueReusableCell(withIdentifier: "cellPassword" , for: indexPath) as! cellPassword
            cell1.nextImage.tintColor = .black
            cell1.avatarTitle.image = UIImage(systemName: "power")
            cell1.avatarTitle.tintColor = UIColor.red
            cell1.titleNewLabel.text = "Đăng Xuất"
            cell1.backgroundColor = .clear
            return cell1
        }else if indexPath.row == 3{
            let cell1 = tableView.dequeueReusableCell(withIdentifier: "cellPassword" , for: indexPath) as! cellPassword
            cell1.nextImage.tintColor = .black
            cell1.avatarTitle.image = UIImage(systemName: "lock.shield.fill")
            cell1.avatarTitle.tintColor = UIColor.blue
            cell1.titleNewLabel.text = "Chính sách và Điều khoản"
            cell1.backgroundColor = .clear
            return cell1
        }else if indexPath.row == 4{
            let cell1 = tableView.dequeueReusableCell(withIdentifier: "cellPassword" , for: indexPath) as! cellPassword
            cell1.nextImage.tintColor = .black
            cell1.avatarTitle.image = UIImage(systemName: "book.fill")
            cell1.titleNewLabel.text = "Hướng dẫn sử dụng"
            cell1.avatarTitle.tintColor = UIColor.blue.withAlphaComponent(0.5)
            cell1.backgroundColor = .clear
            return cell1
        }else if indexPath.row == 5{
            let cell1 = tableView.dequeueReusableCell(withIdentifier: "cellPassword" , for: indexPath) as! cellPassword
            cell1.nextImage.tintColor = .black
            cell1.avatarTitle.tintColor = UIColor.blue.withAlphaComponent(0.5)
            cell1.avatarTitle.image = UIImage(systemName: "bubble.left.and.bubble.right.fill")
            cell1.titleNewLabel.text = "Hỗ trợ"
            cell1.backgroundColor = .clear
            return cell1
        }else if indexPath.row == 6{
            let cell1 = tableView.dequeueReusableCell(withIdentifier: "cellPassword" , for: indexPath) as! cellPassword
            cell1.nextImage.tintColor = .black
            cell1.avatarTitle.tintColor = UIColor.blue
            cell1.avatarTitle.frame = CGRect(x: 5, y: 10, width: 25, height: 25)
            cell1.avatarTitle.image = UIImage(systemName: "envelope.fill")
            cell1.titleNewLabel.text = "Đóng góp ý kiến"
            cell1.backgroundColor = .clear
            return cell1
        }else{
            let cell1 = tableView.dequeueReusableCell(withIdentifier: "cellPassword" , for: indexPath) as! cellPassword
            cell1.nextImage.tintColor = .black
            cell1.avatarTitle.tintColor = UIColor.blue
            cell1.avatarTitle.image = UIImage(systemName: "info.circle.fill")
            cell1.titleNewLabel.text = "Phiên Bản"
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

//            HTTPCookieStorage.shared.removeCookies(since: Date.distantPast)
//            print("[WebCacheCleaner] All cookies deleted")
//            WKWebsiteDataStore.default().fetchDataRecords(ofTypes: WKWebsiteDataStore.allWebsiteDataTypes()) { records in
//                records.forEach { record in
//                    WKWebsiteDataStore.default().removeData(ofTypes: record.dataTypes, for: [record], completionHandler: {
//                        let vc = SFSafariViewController(url: URL(string: "https://id.mvpapp.vn/api/v1")!, entersReaderIfAvailable: true)
//                        vc.delegate = self
//                        self.present(vc, animated: true)
//                    })
//                    print("[WebCacheCleaner] Record \(record) deleted")
//                }
//            }
            let loginVC = LoginVC()
            let window = UIApplication.shared.windows.first
            window?.rootViewController = loginVC
        }
        if indexPath.row == 3{
            navigationController?.pushViewController(TermsVC(), animated: true)
        }
        if indexPath.row == 4{
            navigationController?.pushViewController(UserGuideVC(), animated: true)
        }
        if indexPath.row == 5{
            navigationController?.pushViewController(SupportVC(), animated: true)
        }
        if indexPath.row == 6{
            
        }
        if indexPath.row == 7{
            navigationController?.pushViewController(VersionVC(), animated: true)
        }

    }
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//        return UITableView.automaticDimension
        return 50
    }

}
