//
//  SlideMenuViewController.swift
//  SlideMenuDemo
//
//  Created by Taof on 9/3/19.
//  Copyright © 2019 Taof. All rights reserved.
//

import UIKit
import WebKit

class AvatarVC: UITableViewController {
    var selectName:String!
    
    var itmes = ["Tài Khoản","Đăng Xuất"]
    var tableViewOne: UITableView!
    var tableViewTwo: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.backgroundColor = UIColor(red:0.165, green:0.192, blue:0.259, alpha: 1.000)
        self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor(red:0.086, green:0.510, blue:0.973, alpha: 1.000),NSAttributedString.Key.font: UIFont(name: "Times New Roman", size: 16)!]
        navigationController?.navigationBar.center = .zero
        DispatchQueue.main.async {
            self.title = UserDefaults.standard.string(forKey: "name")
            
        }
        
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        
    }
    
    
    //extension AvatarVC:UITableViewDelegate, UITableViewDataSource{
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itmes.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell" , for: indexPath)
        cell.textLabel?.text = itmes[indexPath.row]
        cell.textLabel?.textColor = .white
        cell.backgroundColor = UIColor(red:0.165, green:0.192, blue:0.259, alpha: 1.000)
        return cell
    }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(itmes[indexPath.row])
        if itmes[indexPath.row] == "Tài Khoản"{
            let profileVC = ProfileVC()
            let navigationController = UINavigationController.init(rootViewController: profileVC)
            navigationController.modalPresentationStyle = .fullScreen
            self.present(navigationController, animated: true)
        }else if itmes[indexPath.row] == "Đăng Xuất" {
            UserDefaults.standard.removeObject(forKey: "session_key")
            UserDefaults.standard.removeObject(forKey: "avatar")
            UserDefaults.standard.removeObject(forKey: "username")
            UserDefaults.standard.removeObject(forKey: "name")
            UserDefaults.standard.removeObject(forKey: "email")
            UserDefaults.standard.removeObject(forKey: "phone")
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
            print("đã đăng xuất")
        }

    }
}
