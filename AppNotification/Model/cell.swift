//
//  CustomCell.swift
//  App Notification
//
//  Created by namit on 11/10/20.
//

import UIKit


class cell: UITableViewCell {
    let containerView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor.white
        view.layer.cornerRadius = 15
        return view
    }()
    let titleNewLabel: UILabel = {
        let titleNewLabel = UILabel()
        titleNewLabel.translatesAutoresizingMaskIntoConstraints = false
        titleNewLabel.textColor = UIColor(red:0.086, green:0.510, blue:0.973, alpha: 1.000)
        titleNewLabel.font = UIFont.init(name: "Arial", size: 18)
        titleNewLabel.textAlignment = .left
        return titleNewLabel
    }()
    let contentLabel: UILabel = {
        let contentLabel = UILabel()
        contentLabel.translatesAutoresizingMaskIntoConstraints = false
        contentLabel.font = UIFont.init(name: "Arial", size: 14)
        contentLabel.textColor = UIColor.black
        contentLabel.numberOfLines = 0
        return contentLabel
    }()
    let timerLabel: UILabel = {
        let titleNewLabel = UILabel()
        titleNewLabel.translatesAutoresizingMaskIntoConstraints = false
        titleNewLabel.textColor = UIColor.blue
        titleNewLabel.font = UIFont.boldSystemFont(ofSize: 10)
        titleNewLabel.textColor = UIColor(red:0.275, green:0.282, blue:0.298, alpha: 1.000)
        titleNewLabel.textAlignment = .left
        return titleNewLabel
    }()

    let avatarTitle: UIImageView = {
        let avatarTitle = UIImageView()
        avatarTitle.translatesAutoresizingMaskIntoConstraints = false
        avatarTitle.image = UIImage(named: "") ?? UIImage()
        avatarTitle.layer.cornerRadius = avatarTitle.frame.size.height/2
        avatarTitle.contentMode = .scaleAspectFit
        avatarTitle.clipsToBounds = true
        avatarTitle.backgroundColor = UIColor(red:0.973, green:0.973, blue:0.980, alpha: 1.000)
        avatarTitle.layer.masksToBounds = true
        return avatarTitle
    }()

    override func awakeFromNib() {
        super.awakeFromNib()
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        addSub()
        setLayout()
        containerView.layer.shadowColor = UIColor.blue.withAlphaComponent(0.5).cgColor

    }
    func addSub(){
        self.addSubview(containerView)
        containerView.addSubview(titleNewLabel)
        containerView.addSubview(contentLabel)
        containerView.addSubview(timerLabel)
        containerView.addSubview(titleNewLabel)
        containerView.addSubview(avatarTitle)
    
    }
    func setLayout(){
        containerView.topAnchor.constraint(equalTo: self.topAnchor, constant: 8).isActive = true
        containerView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20).isActive = true
        containerView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20).isActive = true
        containerView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -5).isActive = true
        
        titleNewLabel.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 5).isActive = true
        titleNewLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -5).isActive = true
        titleNewLabel.widthAnchor.constraint(equalTo: containerView.widthAnchor, multiplier: 0.7, constant: 0).isActive = true
        titleNewLabel.heightAnchor.constraint(equalTo:containerView.heightAnchor,multiplier: 0.3, constant: 0).isActive = true
        
        contentLabel.topAnchor.constraint(equalTo: titleNewLabel.bottomAnchor,constant: 0).isActive  = true
        contentLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -5).isActive = true
        contentLabel.widthAnchor.constraint(equalTo: containerView.widthAnchor, multiplier: 0.7, constant: 0).isActive = true
        contentLabel.heightAnchor.constraint(equalTo: containerView.heightAnchor,multiplier: 0.4, constant: 0).isActive = true
        
        timerLabel.bottomAnchor.constraint(equalTo: containerView.bottomAnchor,constant: -5).isActive  = true
        timerLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -5).isActive = true
        timerLabel.widthAnchor.constraint(equalTo: containerView.widthAnchor, multiplier: 0.7, constant: 0).isActive = true
        timerLabel.heightAnchor.constraint(equalTo: containerView.heightAnchor,multiplier: 0.2, constant: 0).isActive = true
        
        avatarTitle.centerXAnchor.constraint(equalTo: containerView.centerXAnchor, constant: 0).isActive = true
        avatarTitle.centerYAnchor.constraint(equalTo: containerView.centerYAnchor, constant: 0).isActive = true
    }
}
