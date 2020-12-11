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
import WebKit
import SafariServices




class HomeVC: UITableViewController, WKNavigationDelegate, SFSafariViewControllerDelegate{
    var isFirst: Bool = true
    deinit {
        print("Huỷ HomeViewController")
    }
    var dataname: String!
    var imageurl:String!
    var webview: WKWebView!
    var getNotification: getNotify?
    var checkSeSSion: checkSession!
    var content = [String]()
    var id = [Int]()
    var linkUrl = [String]()
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        title = "MVP APP"
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor(red:0.086, green:0.510, blue:0.973, alpha: 1.000),NSAttributedString.Key.font: UIFont(name: "Times New Roman", size: 19)!]
        navigationItem.title = "MVP APP - NOTIFICATION"
        tableView.register(cell.self, forCellReuseIdentifier: "cell")
        tableView.backgroundColor = UIColor(red:0.165, green:0.192, blue:0.259, alpha: 1.000).withAlphaComponent(0.5)
        DispatchQueue.main.async {
            self.checkSession()
            self.getNotify()
        }
    }
    func checkSession(){
        ApiManager.shared.checkSession { [weak self] (_ data) in
            guard let strongSelf = self else {return}
            strongSelf.checkSeSSion = data
            strongSelf.imageurl = APINameManager.shared.avatar + strongSelf.checkSeSSion.avatar!
            let rightMenu = ImageBarButton(withUrl: URL(string: "\(strongSelf.imageurl!)"))
            strongSelf.navigationItem.rightBarButtonItem = rightMenu.load()
        }failure: { (code) in
            self.showAlert(alertText: code, alertMessage: "Thông Tin Đăng Nhập Lỗi.")
            print(code)
        }
    }
    func getNotify(){
        ApiManager.shared.getNotify { [weak self] (_ data) in
            guard let strongSelf = self else {return}
            strongSelf.getNotification = data
            strongSelf.content.append((strongSelf.getNotification?.content)!)
            strongSelf.id.append((strongSelf.getNotification?.id)!)
            strongSelf.linkUrl.append((strongSelf.getNotification?.link)!)
            strongSelf.tableView.reloadData()
        } failure: { (code) in
            self.showAlert(alertText: code, alertMessage: "Không lấy được thông tin")
            print(code)
        }
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print(content.count)
        return id.count
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell" , for: indexPath) as! cell
        cell.titleNewLabel.text = content[indexPath.row]
        cell.titleNewLabel.textColor = .black
        cell.backgroundColor = UIColor.lightGray
        return cell
    }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let indexPath = tableView.indexPathForSelectedRow
        let urls = linkUrl[indexPath!.row]
        webview = WKWebView()
        view = webview
        webview.navigationDelegate = self
        webview.load(URLRequest(url: URL(string: "\(urls)")!))
    }
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//        return UITableView.automaticDimension
        return 120
    }
    
    
}



