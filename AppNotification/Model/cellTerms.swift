//
//  cellTerms.swift
//  AppNotification
//
//  Created by namit on 16/12/2020.
//

import UIKit

class cellTerms: UITableViewCell{
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
        //        titleNewLabel.textColor = UIColor(red:0.086, green:0.510, blue:0.973, alpha: 1.000)
        titleNewLabel.textColor = .black
        titleNewLabel.font = UIFont.init(name: "Times New Roman", size: 17)
        titleNewLabel.text = "Chính sách và điều khoản"
        return titleNewLabel
    }()
    let avatarTitle: UIImageView = {
        let avatarTitle = UIImageView(frame: CGRect(x: 0, y: 0, width: 10, height: 10))
        avatarTitle.translatesAutoresizingMaskIntoConstraints = false
        avatarTitle.image = UIImage.init(systemName: "lock.shield")
        //        avatarTitle.layer.cornerRadius = avatarTitle.frame.size.height/2
        avatarTitle.contentMode = .scaleAspectFit
        avatarTitle.clipsToBounds = true
        return avatarTitle
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
        containerView.addSubview(nextImage)
    
    }
    func setLayout(){
        containerView.topAnchor.constraint(equalTo: self.topAnchor, constant: 10).isActive = true
        containerView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 0).isActive = true
        containerView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: 0).isActive = true
        containerView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: 0).isActive = true
        
        
        avatarTitle.centerYAnchor.constraint(equalTo: containerView.centerYAnchor, constant: 0).isActive = true
        avatarTitle.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 10).isActive = true
        avatarTitle.widthAnchor.constraint(equalToConstant: 20).isActive = true
        avatarTitle.heightAnchor.constraint(equalToConstant: 20).isActive = true
        
        titleNewLabel.centerYAnchor.constraint(equalTo: containerView.centerYAnchor, constant: 0).isActive = true
        titleNewLabel.leadingAnchor.constraint(equalTo: avatarTitle.trailingAnchor, constant: 10).isActive = true
        
        nextImage.centerYAnchor.constraint(equalTo: containerView.centerYAnchor, constant: 0).isActive = true
        nextImage.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -10).isActive = true
    }
}
