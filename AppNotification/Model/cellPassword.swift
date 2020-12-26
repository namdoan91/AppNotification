//
//  cellSetting.swift
//  AppNotification
//
//  Created by namit on 16/12/2020.
//

import Foundation
import UIKit

class cellPassword: UITableViewCell{
    let containerView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor.white
        
        return view
    }()
    let titleNewLabel: UILabel = {
        let titleNewLabel = UILabel()
        titleNewLabel.translatesAutoresizingMaskIntoConstraints = false
//        titleNewLabel.textColor = UIColor(red:0.086, green:0.510, blue:0.973, alpha: 1.000)
        titleNewLabel.textColor = .black
        titleNewLabel.font = UIFont.init(name: "Arial", size: 17)
        titleNewLabel.text = "Thay Đổi Mật Khẩu"
        return titleNewLabel
    }()
    let viewUI: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.cornerRadius = 12
//        view.backgroundColor = .cyan
        view.clipsToBounds = true
        return view
    }()
    let avatarTitle: UIImageView = {
        let avatarTitle = UIImageView(frame: CGRect(x: 10, y: 10, width: 30, height: 30))
        avatarTitle.clipsToBounds = true
        return avatarTitle
    }()
    let nextImage: UIImageView = {
        let avatarTitle = UIImageView(frame: CGRect(x: 0, y: 0, width: 40, height: 40))
        avatarTitle.translatesAutoresizingMaskIntoConstraints = false
        return avatarTitle
    }()
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        addSub()
        setLayout()
//        let layer = CAGradientLayer()
//        layer.frame = CGRect(x: 0, y: 0, width: 50, height: 50)
//        layer.colors = [UIColor(red: 0.114, green: 0.455, blue: 0.949, alpha: 1).cgColor, UIColor(red: 0.102, green: 0.753, blue: 0.980, alpha: 1).cgColor]
//        viewUI.layer.addSublayer(layer)
    }
    func addSub(){
        self.addSubview(containerView)
        containerView.addSubview(titleNewLabel)
        containerView.addSubview(viewUI)
        viewUI.addSubview(avatarTitle)
//        containerView.addSubview(avatarTitle)
        containerView.addSubview(nextImage)
        
        
    }
    func setLayout(){
        containerView.topAnchor.constraint(equalTo: self.topAnchor, constant: 0).isActive = true
        containerView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 0).isActive = true
        containerView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: 0).isActive = true
        containerView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: 0).isActive = true
        //setup avatar
        
        viewUI.centerYAnchor.constraint(equalTo: containerView.centerYAnchor, constant: 0).isActive = true
        viewUI.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 10).isActive = true
        viewUI.widthAnchor.constraint(equalToConstant: 50).isActive = true
        viewUI.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        avatarTitle.centerYAnchor.constraint(equalTo: viewUI.centerYAnchor, constant: 0).isActive = true
        avatarTitle.centerXAnchor.constraint(equalTo: viewUI.centerXAnchor, constant: 0).isActive = true
        avatarTitle.widthAnchor.constraint(equalToConstant: 40).isActive = true
        avatarTitle.heightAnchor.constraint(equalToConstant: 40).isActive = true
        
        //setup ten
        titleNewLabel.centerYAnchor.constraint(equalTo: containerView.centerYAnchor, constant: 0).isActive = true
        titleNewLabel.leadingAnchor.constraint(equalTo: viewUI.trailingAnchor, constant: 10).isActive = true
        //setup con trỏ
        nextImage.centerYAnchor.constraint(equalTo: containerView.centerYAnchor, constant: 0).isActive = true
        nextImage.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -10).isActive = true
    }
}
