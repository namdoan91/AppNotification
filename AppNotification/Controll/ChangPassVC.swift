//
//  ChangPassVC.swift
//  AppNotification
//
//  Created by namit on 07/12/2020.
//

import UIKit

class ChangPassVC: UIViewController {
    deinit {
        print("Huỷ ChangePass Controller")
    }
    let container:UIView = {
        let container = UIView()
        container.translatesAutoresizingMaskIntoConstraints = false
        container.backgroundColor = UIColor.white
        container.clipsToBounds = true
        return container
    }()
    let stackview: UIStackView = {
        let stackview = UIStackView()
        stackview.translatesAutoresizingMaskIntoConstraints = false
        //        stackview.backgroundColor = UIColor.lightGray.withAlphaComponent(0.2)
        stackview.layer.cornerRadius = 20
        stackview.clipsToBounds = true
        return stackview
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController!.navigationBar.setBackgroundImage(UIImage(), for: .default)
        navigationController!.navigationBar.shadowImage = UIImage()
        navigationController?.navigationBar.isTranslucent = true
        addSub();setLayout()
        DispatchQueue.main.async {
            self.container.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(self.animationOut)))
        }
    }
    func addSub(){
        view.addSubview(container)
    }
    func setLayout(){
        container.topAnchor.constraint(equalTo: view.topAnchor, constant: 0).isActive = true
        container.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0).isActive = true
        container.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0).isActive = true
        container.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0).isActive = true
    }
    @objc func animationOut(){
        UIView.animate(withDuration: 0.3){
            self.container.transform = CGAffineTransform(translationX: 0, y: -self.view.frame.height)
            self.dismiss(animated: true, completion: nil)
        }
    }

}
