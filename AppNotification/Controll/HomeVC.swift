//
//  HomeVC.swift
//  AppNotification
//
//  Created by namit on 03/12/2020.
//

import UIKit
import Alamofire
import SwiftyJSON
import Kingfisher
import SideMenu
import WebKit
import SafariServices

class HomeVC: UITableViewController, WKNavigationDelegate, SFSafariViewControllerDelegate{
    var isFirst: Bool = true
    deinit {
        print("Huỷ HomeViewController")
    }
    
    let host = "https://id.mvpapp.vn/"
    var download = ""
    var menu:SideMenuNavigationController!
    var avatarMenu:SideMenuNavigationController!
    var dataname: String!
    var imageurl:String!
    var items = ["test", "demo"]
    var webview: WKWebView!
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        //        let signout = UIBarButtonItem(image: UIImage.init(systemName: "ellipsis"), style: .done, target: self, action: #selector(Menu))
        //        navigationItem.leftBarButtonItem = signout
//        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
//        navigationController?.navigationBar.shadowImage = UIImage()
//        navigationController?.navigationBar.isTranslucent = true
//        navigationController?.view.backgroundColor = .clear
        
        //        let editMenu = UIBarButtonItem(image: UIImage.init(systemName: "line.horizontal.3.decrease"), style: .done, target: self, action: #selector(Profile))
        //        navigationItem.rightBarButtonItem = editMenu
        title = "MVP APP"
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor(red:0.086, green:0.510, blue:0.973, alpha: 1.000),NSAttributedString.Key.font: UIFont(name: "Times New Roman", size: 19)!]
        addSub();setLayout()
        navigationItem.title = "MVP APP - NOTIFICATION"
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        tableView.backgroundColor = UIColor(red:0.165, green:0.192, blue:0.259, alpha: 1.000)
        DispatchQueue.main.async {
            self.checkSession()
            self.avatarMenu = SideMenuNavigationController(rootViewController: AvatarVC())
            self.avatarMenu.menuWidth = self.view.frame.width/2
            self.menu = SideMenuNavigationController(rootViewController: MenuVC())
            self.menu?.leftSide = true
            self.menu.menuWidth = self.view.frame.width/2
        }
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        navigationController?.navigationItem.title = "Hello"
        navigationController?.navigationBar.isHidden = false
    }
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
    }
    //    @objc func Profile1(){
    //
    //        present(avatarMenu!, animated: true)
    //        print("Profile")
    //    }
    //    @objc func Menu(){
    //        UserDefaults.standard.removeObject(forKey: "session_key")
    //        let loginVC = LoginVC()
    //        let window = UIApplication.shared.windows.first
    //        window?.rootViewController = loginVC
    //        present(menu!, animated: true)
    //        print("MENU")
    //    }
    func checkSession(){
        let checksession = "https://id.mvpapp.vn/api/v1/system/checkSession"
        let sessionKey = UserDefaults.standard.string(forKey: "session_key") ?? ""
        let par = ["session_key" : sessionKey]
        AF.request(checksession, method: .post, parameters: par, encoding: URLEncoding.default).responseJSON{ [weak self]
            response in
            guard let strongSelf = self else{return}
            switch response.result{
            case .success(let object):
                let json = JSON(object)
                print(json)
                if json["CODE"].stringValue == "SUCCESS"{
                    let data = AppNotification.checkSession(json: json["userData"])
                    strongSelf.dataname = (data?.name)!
                    strongSelf.imageurl = strongSelf.host+(data?.avatar)!
                    print(strongSelf.imageurl!)
                    let username = data?.username
                    let email = data?.email
                    let phone = data?.phone
                    UserDefaults.standard.setValue(strongSelf.imageurl, forKey: "avatar")
                    UserDefaults.standard.setValue(username, forKey: "username")
                    UserDefaults.standard.setValue(strongSelf.dataname, forKey: "name")
                    UserDefaults.standard.setValue(email, forKey: "email")
                    UserDefaults.standard.setValue(phone, forKey: "phone")
                    let rightMenu = ImageBarButton(withUrl: URL(string: "\(strongSelf.imageurl!)"))
                    //                    rightMenu.button.addTarget(self, action: #selector(strongSelf.Profile1), for: .touchUpInside)
                    strongSelf.navigationItem.rightBarButtonItem = rightMenu.load()
                }
                if json["CODE"].stringValue == "SESSION_KEY_INVALID"{
                    DispatchQueue.main.async{
                        UserDefaults.standard.removeObject(forKey: "session_key")
                        let loginVC = LoginVC()
                        let window = UIApplication.shared.windows.first
                        window?.rootViewController = loginVC
                    }
                }
            case .failure(let err):
                print(err.localizedDescription)
            }
        }
    }
    func addSub(){
        
    }
    func setLayout(){
        
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        items.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell" , for: indexPath)
        cell.textLabel?.text = items[indexPath.row]
        cell.textLabel?.textColor = .white
        cell.backgroundColor = UIColor(red:0.165, green:0.192, blue:0.259, alpha: 1.000)
        return cell
    }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if items[indexPath.row] == "test"{
            let url = URL(string: "https://tangca.mvpapp.vn/admin/tangca/thongketoancongty")!
//            let vc = SFSafariViewController(url: url)
    
            webview = WKWebView()
            webview.navigationDelegate = self
            
            view = webview
//            NotificationCenter.default.post(name: NSNotification.Name(rawValue: "webview"), object: "data")
            if webview.load(URLRequest(url: url)) != nil{
//                navigationController?.navigationBar.isHidden = true
            }
            
//            vc.delegate = self
//            navigationController?.pushViewController(vc, animated: true)
//            present(vc, animated: true, completion: nil)
        }
    }
    
    
}



