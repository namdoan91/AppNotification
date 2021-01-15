//
//  UserGuideVC.swift
//  AppNotification
//
//  Created by namit on 21/12/2020.
//

import UIKit

class UserGuideVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor(red:0.086, green:0.510, blue:0.973, alpha: 1.000),NSAttributedString.Key.font: UIFont(name: "Arial", size: 19)!]
        navigationItem.title = "Hướng dẫn sử dụng"
        view.backgroundColor = .white
    }
    

}
