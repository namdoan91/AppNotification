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
        view.backgroundColor = UIColor.blue.withAlphaComponent(0.5)
//        view.layer.cornerRadius = 15
        return view
    }()
    let titleNewLabel: UILabel = {
        let titleNewLabel = UILabel()
        titleNewLabel.translatesAutoresizingMaskIntoConstraints = false
        titleNewLabel.textColor = UIColor.white
        titleNewLabel.font = UIFont.init(name: "Arial", size: 22)
        titleNewLabel.textAlignment = .left
        return titleNewLabel
    }()
    let viewUI: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
//        view.backgroundColor = .cyan
        return view
    }()
    let avatarTitle: UIImageView = {
        let avatarTitle = UIImageView(frame: CGRect(x: 0, y: 0, width: 40, height: 40))
        avatarTitle.translatesAutoresizingMaskIntoConstraints = false
        avatarTitle.image = UIImage(named: "") ?? UIImage()
        avatarTitle.layer.cornerRadius = avatarTitle.frame.size.height/2
        avatarTitle.contentMode = .scaleAspectFill
        avatarTitle.clipsToBounds = true
//        avatarTitle.backgroundColor = .red
        return avatarTitle
    }()
    let titleMSNV: UILabel = {
        let titleNewLabel = UILabel()
        titleNewLabel.translatesAutoresizingMaskIntoConstraints = false
        titleNewLabel.textColor = .white
        titleNewLabel.font = UIFont.boldSystemFont(ofSize: 19)
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
        containerView.layer.cornerRadius = 5
        let seperatorView = UIView.init(frame: CGRect(x: 70, y: containerView.frame.size.height, width: containerView.frame.size.width - 90, height: 1))
        seperatorView.backgroundColor = .lightGray
        containerView.addSubview(seperatorView)
    }
    func addSub(){
        self.addSubview(containerView)
        containerView.addSubview(titleNewLabel)
        containerView.addSubview(viewUI)
//        viewUI.addSubview(avatarTitle)
        containerView.addSubview(avatarTitle)
        containerView.addSubview(titleMSNV)
        containerView.addSubview(nextImage)
    
    }
    func setLayout(){
        containerView.topAnchor.constraint(equalTo: self.topAnchor, constant: 0).isActive = true
        containerView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 0).isActive = true
        containerView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: 0).isActive = true
        containerView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: 0).isActive = true
        
        viewUI.centerYAnchor.constraint(equalTo: containerView.centerYAnchor, constant: 0).isActive = true
        viewUI.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 10).isActive = true
        viewUI.widthAnchor.constraint(equalToConstant: 50).isActive = true
        viewUI.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        avatarTitle.centerYAnchor.constraint(equalTo: viewUI.centerYAnchor, constant: 0).isActive = true
        avatarTitle.centerXAnchor.constraint(equalTo: viewUI.centerXAnchor, constant: 0).isActive = true
        avatarTitle.widthAnchor.constraint(equalToConstant: 40).isActive = true
        avatarTitle.heightAnchor.constraint(equalToConstant: 40).isActive = true
        
        titleNewLabel.centerYAnchor.constraint(equalTo: containerView.centerYAnchor, constant: 0).isActive = true
        titleNewLabel.leadingAnchor.constraint(equalTo: avatarTitle.trailingAnchor, constant: 10).isActive = true
        
//        titleMSNV.centerYAnchor.constraint(equalTo: containerView.centerYAnchor, constant: 10).isActive = true
//        titleMSNV.leadingAnchor.constraint(equalTo: avatarTitle.trailingAnchor, constant: 10).isActive = true
        
        nextImage.centerYAnchor.constraint(equalTo: containerView.centerYAnchor, constant: 0).isActive = true
        nextImage.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -10).isActive = true
    }
}
