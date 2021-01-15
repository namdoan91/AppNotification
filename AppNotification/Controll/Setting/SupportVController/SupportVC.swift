//
//  SupportVC.swift
//  AppNotification
//
//  Created by namit on 21/12/2020.
//

import UIKit


class SupportVC: UITableViewController {
    deinit {
        print("Huỷ SupportVCViewController")
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(cellSupport.self, forCellReuseIdentifier: "cellSupport")
        navigationItem.title = "Hỗ trợ"
        view.backgroundColor = .white
        tableView.separatorStyle = .none
    }
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellSupport") as! cellSupport
        cell.textLabel?.text = "test"
        cell.accessoryType = .disclosureIndicator
        return cell
    }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        navigationController?.pushViewController(ChatBoxSupport(), animated: true)
    }
}
