//
//  Cell Profile.swift
//  AppNotification
//
//  Created by namit on 16/12/2020.
//

import Foundation
import UIKit

class cellProfile: UITableViewCell{
    let containerView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor.white
//        view.layer.cornerRadius = 15
        return view
    }()
    let titleNewLabel: UILabel = {
        let titleNewLabel = UILabel()
        titleNewLabel.translatesAutoresizingMaskIntoConstraints = false
        titleNewLabel.textColor = UIColor(red:0.086, green:0.510, blue:0.973, alpha: 1.000)
        titleNewLabel.font = UIFont.init(name: "Times New Roman", size: 20)
        titleNewLabel.textAlignment = .left
        return titleNewLabel
    }()
    let avatarTitle: UIImageView = {
        let avatarTitle = UIImageView(frame: CGRect(x: 0, y: 0, width: 40, height: 40))
        avatarTitle.translatesAutoresizingMaskIntoConstraints = false
        avatarTitle.image = UIImage(named: "") ?? UIImage()
        avatarTitle.layer.cornerRadius = avatarTitle.frame.size.height/2
        avatarTitle.contentMode = .scaleAspectFill
        avatarTitle.clipsToBounds = true
        avatarTitle.backgroundColor = .red
        return avatarTitle
    }()
    let titleMSNV: UILabel = {
        let titleNewLabel = UILabel()
        titleNewLabel.translatesAutoresizingMaskIntoConstraints = false
        titleNewLabel.textColor = .black
        titleNewLabel.font = UIFont.init(name: "Times New Roman", size: 14)
        titleNewLabel.textAlignment = .left
        return titleNewLabel
    }()
    let nextImage: UIImageView = {
        let avatarTitle = UIImageView(frame: CGRect(x: 0, y: 0, width: 40, height: 40))
        avatarTitle.translatesAutoresizingMaskIntoConstraints = false
        avatarTitle.image = UIImage.init(systemName: "chevron.right")
        return avatarTitle
    }()
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        addSub()
        setLayout()
        containerView.layer.shadowColor = UIColor.blue.withAlphaComponent(0.5).cgColor

    }
    func addSub(){
        self.addSubview(containerView)
        containerView.addSubview(titleNewLabel)
        containerView.addSubview(avatarTitle)
        containerView.addSubview(titleMSNV)
        containerView.addSubview(nextImage)
    
    }
    func setLayout(){
        containerView.topAnchor.constraint(equalTo: self.topAnchor, constant: 10).isActive = true
        containerView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 0).isActive = true
        containerView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: 0).isActive = true
        containerView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -10).isActive = true
        
//        titleNewLabel.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 5).isActive = true
//        titleNewLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -5).isActive = true
//        titleNewLabel.widthAnchor.constraint(equalTo: containerView.widthAnchor, multiplier: 0.7, constant: 0).isActive = true
//        titleNewLabel.heightAnchor.constraint(equalTo:containerView.heightAnchor,multiplier: 0.3, constant: 0).isActive = true
        
        avatarTitle.centerYAnchor.constraint(equalTo: containerView.centerYAnchor, constant: 0).isActive = true
        avatarTitle.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 10).isActive = true
        avatarTitle.widthAnchor.constraint(equalToConstant: 40).isActive = true
        avatarTitle.heightAnchor.constraint(equalToConstant: 40).isActive = true
        
        titleNewLabel.centerYAnchor.constraint(equalTo: containerView.centerYAnchor, constant: -10).isActive = true
        titleNewLabel.leadingAnchor.constraint(equalTo: avatarTitle.trailingAnchor, constant: 10).isActive = true
//        titleNewLabel.widthAnchor.constraint(equalTo: containerView.widthAnchor, multiplier: 0.7, constant: 0).isActive = true
//        titleNewLabel.heightAnchor.constraint(equalTo:containerView.heightAnchor,multiplier: 0.3, constant: 0).isActive = true
        
        titleMSNV.centerYAnchor.constraint(equalTo: containerView.centerYAnchor, constant: 10).isActive = true
        titleMSNV.leadingAnchor.constraint(equalTo: avatarTitle.trailingAnchor, constant: 10).isActive = true
        
        nextImage.centerYAnchor.constraint(equalTo: containerView.centerYAnchor, constant: 0).isActive = true
        nextImage.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -10).isActive = true
    }
}
