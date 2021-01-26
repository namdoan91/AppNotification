//
//  HomeProfileVC.swift
//  AppNotification
//
//  Created by namit on 11/01/2021.
//

import UIKit
import Kingfisher
import FirebaseMessaging
import JXWebViewController
import SVProgressHUD
import WebKit

class HomeProfileVC: UIViewController,WKNavigationDelegate, MessagingDelegate {
    let containerView: UIView = {
        let container = UIView()
        container.backgroundColor = UIColor.white
        container.translatesAutoresizingMaskIntoConstraints = false
        return container
    }()
    let topview: UIImageView = {
        let topview = UIImageView()
        topview.translatesAutoresizingMaskIntoConstraints = false
        topview.image = UIImage(named: "Image-1")
        return topview
    }()
    
    let topview1: UIImageView = {
        let topview = UIImageView()
        topview.translatesAutoresizingMaskIntoConstraints = false
        topview.image = UIImage(named: "Image-2")
        return topview
    }()
    let avatarTitle: UIImageView = {
        let avatarTitle = UIImageView(frame: CGRect(x: 0, y: 0, width: 120, height: 120))
        avatarTitle.translatesAutoresizingMaskIntoConstraints = false
        avatarTitle.image = UIImage(named: "") ?? UIImage()
        avatarTitle.layer.cornerRadius = avatarTitle.frame.size.height/2
        avatarTitle.contentMode = .scaleAspectFill
        avatarTitle.clipsToBounds = true
//        avatarTitle.backgroundColor = .red
        avatarTitle.isUserInteractionEnabled = true
        return avatarTitle
    }()
    let titleNewLabel: UILabel = {
        let titleNewLabel = UILabel()
        titleNewLabel.translatesAutoresizingMaskIntoConstraints = false
        titleNewLabel.textColor = UIColor.blue
        titleNewLabel.font = UIFont.init(name: "Arial", size: 22)
        titleNewLabel.textAlignment = .left
        return titleNewLabel
    }()
    let infoView: UIImageView = {
        let topview = UIImageView()
        topview.translatesAutoresizingMaskIntoConstraints = false
        topview.image = UIImage(named: "Image-5")?.withTintColor(UIColor.black.withAlphaComponent(0.7))
        topview.backgroundColor = .white
        topview.layer.cornerRadius = 15
        topview.contentMode = .scaleAspectFit
        topview.clipsToBounds = true
        return topview
    }()
    var dataProfile: checkSession!
    var titleName = String()
    var avatarName = String()
    let tableView: UITableView = {
        let tableview = UITableView()
        tableview.translatesAutoresizingMaskIntoConstraints = false
        return tableview
    }()
    let groups = ["SignInOut", "Support"]
    let items = [
        ["Đổi mật khẩu", "Đăng xuất"],
        ["Chính sách và Điều khoản", "Hướng dẫn sử dụng" ,"Hỗ trợ", "Đóng góp ý kiến", "Phiên bản"]
    ]
    override func viewDidLoad() {
        super.viewDidLoad()
//        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor(red:0.086, green:0.510, blue:0.973, alpha: 1.000),NSAttributedString.Key.font: UIFont(name: "Arial", size: 19)!]
        navigationController!.navigationBar.setBackgroundImage(UIImage(), for: .default)
        navigationController!.navigationBar.shadowImage = UIImage()
        navigationController?.navigationBar.isTranslucent = true
        navigationController?.navigationBar.backgroundColor = .clear
        title = "Home Profile"
        SVProgressHUD.dismiss()
        addSub();setLayout()
        DispatchQueue.main.async {
            self.checkSession()
        }
        tableView.register(cellProfile.self, forCellReuseIdentifier: "cellProfile")
        tableView.register(cellPassword.self, forCellReuseIdentifier: "cellPassword")
        tableView.separatorStyle = .none
        tableView.isScrollEnabled = false
        tableView.backgroundColor = .white
        tableView.layer.cornerRadius = 15
        tableView.dataSource = self
        tableView.delegate = self
        avatarTitle.addGestureRecognizer(UITapGestureRecognizer.init(target: self, action: #selector(profilename)))
        avatarTitle.isUserInteractionEnabled = true
    }

    func addSub(){
        view.addSubview(containerView)
        containerView.addSubview(topview1)
        containerView.addSubview(topview)
        containerView.addSubview(avatarTitle)
        containerView.addSubview(infoView)
        containerView.addSubview(titleNewLabel)
        containerView.addSubview(tableView)
    }
    func setLayout(){
        containerView.topAnchor.constraint(equalTo: view.topAnchor, constant: 0).isActive = true
        containerView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0).isActive = true
        containerView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0).isActive = true
        containerView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0).isActive = true
        
        topview.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 0).isActive = true
        topview.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 0).isActive = true
        topview.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: 0).isActive = true
        topview.heightAnchor.constraint(equalToConstant: 160).isActive = true
        
        topview1.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 0).isActive = true
        topview1.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 0).isActive = true
        topview1.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: 0).isActive = true
        topview1.heightAnchor.constraint(equalToConstant: 180).isActive = true
        
        avatarTitle.centerXAnchor.constraint(equalTo: containerView.centerXAnchor, constant: 0).isActive = true
        avatarTitle.topAnchor.constraint(equalTo: view.layoutMarginsGuide.topAnchor, constant: 20).isActive = true
        avatarTitle.widthAnchor.constraint(equalToConstant: 120).isActive = true
        avatarTitle.heightAnchor.constraint(equalToConstant: 120).isActive = true
        
        infoView.trailingAnchor.constraint(equalTo: avatarTitle.trailingAnchor, constant: -10).isActive = true
        infoView.bottomAnchor.constraint(equalTo: avatarTitle.bottomAnchor, constant: 0).isActive = true
        infoView.widthAnchor.constraint(equalToConstant: 30).isActive = true
        infoView.heightAnchor.constraint(equalToConstant: 30).isActive = true
        
        titleNewLabel.centerXAnchor.constraint(equalTo: avatarTitle.centerXAnchor, constant: 0).isActive = true
        titleNewLabel.topAnchor.constraint(equalTo: avatarTitle.bottomAnchor, constant: 10).isActive = true
        
        tableView.topAnchor.constraint(equalTo: titleNewLabel.bottomAnchor, constant: 30).isActive = true
        tableView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 5).isActive = true
        tableView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -5).isActive = true
        tableView.bottomAnchor.constraint(equalTo: containerView.layoutMarginsGuide.bottomAnchor, constant: 0).isActive = true
    }
    func checkSession(){
        ApiManager.shared.checkSession { [weak self] (_ data) in
            guard let strongSelf = self else {return}
            strongSelf.dataProfile = data
            strongSelf.avatarName = strongSelf.dataProfile.avatar!
            strongSelf.avatarTitle.setImage(urlString: strongSelf.avatarName)
            strongSelf.titleName = strongSelf.dataProfile.name!
            strongSelf.titleNewLabel.text = strongSelf.titleName
            let title = UILabel()
            title.text = strongSelf.dataProfile.username!
            title.textColor = .white
            title.font = UIFont.init(name: "arial", size: 34)
            strongSelf.navigationItem.titleView = title
    
        }failure: { (code) in
            self.showAlert(alertText: code, alertMessage: "Thông Tin Đăng Nhập Lỗi.")
        }
    }
    @objc func profilename(){
        navigationController?.pushViewController(ProfileName(), animated: true)
        navigationItem.backButtonTitle = "Quay Lại"
    }
}
extension HomeProfileVC: UITableViewDelegate, UITableViewDataSource{
    func numberOfSections(in tableView: UITableView) -> Int {
        return groups.count
    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 40
    }
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        return nil;
    }
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        return nil;
    }
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return .leastNormalMagnitude
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items[section].count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let layer = CAGradientLayer()
        layer.frame = CGRect(x: 0, y: 0, width: 50, height: 50)
        if indexPath.section == 0{
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
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        navigationItem.backButtonTitle = "Quay Lại"
        if indexPath.section == 0 && indexPath.row == 0{
            navigationController?.pushViewController(ChangPassVC(), animated: true)
        }else if indexPath.section == 0 && indexPath.row == 1{
            UserDefaults.standard.removeObject(forKey: "session_key")
            let username = UserDefaults.standard.string(forKey: "username") ?? ""
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
        
        if indexPath.section == 1 && indexPath.row == 0{
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
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//        return UITableView.automaticDimension
        return 60
    }
    func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        let header = view as! UITableViewHeaderFooterView
        header.textLabel?.textColor = UIColor.black
        if section == 0{
            header.textLabel?.text = "Cài Đặt"
        }else {
            header.textLabel?.text = "Điều Khoản và Trợ Giúp"
        }
        
    }
}
