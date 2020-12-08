//
//  MenuVC.swift
//  AppNotification
//
//  Created by namit on 07/12/2020.
//

import UIKit
import SafariServices
import JXWebViewController
import WebKit


class MenuVC: UITableViewController, SFSafariViewControllerDelegate {
var items = ["test", "demo"]
    override func viewDidLoad() {
        super.viewDidLoad()

        title = "MVP APP"
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor(red:0.086, green:0.510, blue:0.973, alpha: 1.000),NSAttributedString.Key.font: UIFont(name: "Times New Roman", size: 19)!]
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        tableView.backgroundColor = UIColor(red:0.165, green:0.192, blue:0.259, alpha: 1.000)
        navigationController?.navigationBar.center = .zero
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
//            let vc = SFSafariViewController(url: URL(string: "\(url)")!)
//            vc.delegate = self
//            let vc = JXWebViewController()
            let vc = 
            vc.webView.load(URLRequest(url: url))
            
            navigationController?.pushViewController(vc, animated: true)
        }
    }
}
