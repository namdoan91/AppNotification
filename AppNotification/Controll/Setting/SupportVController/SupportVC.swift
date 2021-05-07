//
//  SupportVC.swift
//  AppNotification
//
//  Created by namitMacOs on 29/03/2021.
//

import UIKit
import MessageKit

class SupportVC: UIViewController {

    
    let tableViewChat: UITableView = {
        let tableviewchat = UITableView()
        tableviewchat.translatesAutoresizingMaskIntoConstraints = false
        return tableviewchat
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        addSub();layOut()
        title = "Hỗ Trợ"
        tableViewChat.register(cellSupport.self, forCellReuseIdentifier: "cellSupport")
        tableViewChat.delegate = self
        tableViewChat.dataSource = self
    }
    
    func addSub(){
        view.addSubview(tableViewChat)
    }
    func layOut(){
        tableViewChat.topAnchor.constraint(equalTo: view.layoutMarginsGuide.topAnchor, constant: 0).isActive = true
        tableViewChat.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0).isActive = true
        tableViewChat.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0).isActive = true
        tableViewChat.bottomAnchor.constraint(equalTo: view.layoutMarginsGuide.bottomAnchor, constant: 0).isActive = true
    }

}
extension SupportVC: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellSupport", for: indexPath) as! cellSupport
        cell.textLabel?.text = "NamIT"
        cell.accessoryType = .disclosureIndicator
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let vc = ChatVC()
        vc.title = "CHAT"
        navigationController?.pushViewController(vc, animated: true)
        
    }
    
}
