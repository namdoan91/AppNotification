//
//  TableViewCell.swift
//  AppNotification
//
//  Created by namit on 15/03/2021.
//

import UIKit

class TableViewCell: UITableViewCell {
    let containerView: UIView = {
        let containerView = UIView()
        containerView.translatesAutoresizingMaskIntoConstraints = false
        return containerView
    }()
    let infoView: UIView = {
        let infoview = UIView()
        infoview.translatesAutoresizingMaskIntoConstraints = false
        infoview.layer.cornerRadius = 20
//        infoview.clipsToBounds = true
        infoview.layer.masksToBounds = true
        return infoview
    }()
    let Circle: UIView = {
        let cricle = UIView(frame: CGRect(x: 0, y: 0, width: 100, height: 100))
        cricle.translatesAutoresizingMaskIntoConstraints = false
        cricle.layer.cornerRadius = cricle.frame.width/2
        cricle.backgroundColor = .yellow
        cricle.layer.masksToBounds = true
        return cricle
    }()
    let ID: UIImageView = {
        let id = UIImageView()
        id.translatesAutoresizingMaskIntoConstraints = false
        id.image = UIImage.init(named: "")
        return id
    }()
    let idPhieu: UILabel = {
        let id = UILabel()
        id.translatesAutoresizingMaskIntoConstraints = false
        id.text = "12"
        id.font = UIFont.boldSystemFont(ofSize: 10)
//        id.numberOfLines = 0
        id.textColor = .black
        id.textAlignment = .left
        return id
    }()
    let message: UILabel = {
        let id = UILabel()
        id.translatesAutoresizingMaskIntoConstraints = false
        id.text = "12"
        id.font = UIFont.boldSystemFont(ofSize: 14)
//        id.numberOfLines = 0
        id.textColor = .lightGray
        id.textAlignment = .left
        return id
    }()
    let title: UILabel = {
        let id = UILabel()
        id.translatesAutoresizingMaskIntoConstraints = false
        id.text = "12"
        id.font = UIFont.boldSystemFont(ofSize: 18)
        id.numberOfLines = 0
        id.textColor = .black
        id.textAlignment = .left
        return id
    }()
    let createAt: UILabel = {
        let id = UILabel()
        id.translatesAutoresizingMaskIntoConstraints = false
        id.text = "12"
        id.font = UIFont.boldSystemFont(ofSize: 12)
        id.numberOfLines = 0
        id.textAlignment = .right
        return id
    }()
    let badgeSize:CGFloat = 20
    let bagdeView: UIView = {
        let badgeSize:CGFloat = 20
        let badgeview = UIView()
        badgeview.translatesAutoresizingMaskIntoConstraints = false
        badgeview.backgroundColor = .red
        badgeview.layer.cornerRadius = badgeSize/2
        return badgeview
    }()
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        addSub();setLayout()
    }
    func addSub(){
        self.addSubview(containerView)
        containerView.addSubview(infoView)
        containerView.addSubview(Circle)
//        infoView.addSubview(idPhieu)
        infoView.addSubview(title)
        infoView.addSubview(message)
        infoView.addSubview(createAt)
        Circle.addSubview(ID)
        Circle.addSubview(idPhieu)
        Circle.addSubview(bagdeView)
        
    }
    func setLayout(){
        containerView.topAnchor.constraint(equalTo: self.topAnchor, constant: 5).isActive = true
        containerView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10).isActive = true
        containerView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: 0).isActive = true
        containerView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: 0).isActive = true
        
        infoView.centerXAnchor.constraint(equalTo: containerView.centerXAnchor, constant: -10).isActive = true
        infoView.centerYAnchor.constraint(equalTo: containerView.centerYAnchor, constant: 0).isActive = true
        infoView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 5).isActive = true
        infoView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -10).isActive = true
        infoView.heightAnchor.constraint(equalToConstant: 80).isActive = true
        
        //layout ID
        Circle.centerYAnchor.constraint(equalTo: containerView.centerYAnchor, constant: 0).isActive = true
        Circle.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 0).isActive = true
        Circle.widthAnchor.constraint(equalToConstant: 100).isActive = true
        Circle.heightAnchor.constraint(equalToConstant: 100).isActive = true
 
        
        ID.centerXAnchor.constraint(equalTo: Circle.centerXAnchor, constant: 0).isActive = true
        ID.centerYAnchor.constraint(equalTo: Circle.centerYAnchor, constant: 0).isActive = true
        ID.widthAnchor.constraint(equalToConstant: 50).isActive = true
        ID.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        idPhieu.centerXAnchor.constraint(equalTo: Circle.centerXAnchor, constant: 0).isActive = true
        idPhieu.centerYAnchor.constraint(equalTo: Circle.centerYAnchor, constant: 30).isActive = true
        idPhieu.heightAnchor.constraint(equalToConstant: 10).isActive = true
        
        bagdeView.rightAnchor.constraint(equalTo: Circle.rightAnchor, constant: -14).isActive = true
        bagdeView.topAnchor.constraint(equalTo: Circle.topAnchor, constant: 2).isActive = true
        bagdeView.widthAnchor.constraint(equalToConstant: badgeSize).isActive = true
        bagdeView.heightAnchor.constraint(equalToConstant: badgeSize).isActive = true
//
        //layout content & createAt

        
        title.centerYAnchor.constraint(equalTo: infoView.centerYAnchor, constant: -8).isActive = true
        title.leadingAnchor.constraint(equalTo: Circle.trailingAnchor,constant: 5).isActive = true
        title.trailingAnchor.constraint(equalTo: infoView.trailingAnchor,constant: -5).isActive = true
        title.heightAnchor.constraint(equalToConstant: 20).isActive = true
        
        message.centerYAnchor.constraint(equalTo: infoView.centerYAnchor, constant: 14).isActive = true
        message.leadingAnchor.constraint(equalTo: Circle.trailingAnchor,constant: 5).isActive = true
        message.trailingAnchor.constraint(equalTo: infoView.trailingAnchor,constant: -5).isActive = true
        message.heightAnchor.constraint(equalToConstant: 20).isActive = true
        
        createAt.topAnchor.constraint(equalTo: infoView.topAnchor, constant: 5).isActive = true
        createAt.trailingAnchor.constraint(equalTo: infoView.trailingAnchor, constant: -5).isActive = true
        createAt.leadingAnchor.constraint(equalTo: infoView.leadingAnchor, constant: 5).isActive = true
        createAt.heightAnchor.constraint(equalToConstant: 14).isActive = true
    }
}
