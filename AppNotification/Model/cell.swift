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
        titleNewLabel.font = UIFont.init(name: "Arial", size: 20)
        titleNewLabel.textAlignment = .left
        return titleNewLabel
    }()
    let contentLabel: UILabel = {
        let contentLabel = UILabel()
        contentLabel.translatesAutoresizingMaskIntoConstraints = false
        contentLabel.font = UIFont.init(name: "Arial", size: 16)
        contentLabel.textColor = UIColor.black
        contentLabel.numberOfLines = 0
        return contentLabel
    }()
    let timerLabel: UILabel = {
        let titleNewLabel = UILabel()
        titleNewLabel.translatesAutoresizingMaskIntoConstraints = false
        titleNewLabel.textColor = UIColor.blue
        titleNewLabel.font = UIFont.boldSystemFont(ofSize: 12)
        titleNewLabel.textColor = UIColor(red:0.275, green:0.282, blue:0.298, alpha: 1.000)
        titleNewLabel.textAlignment = .left
        return titleNewLabel
    }()

    let issue: UIImageView = {
        let avatarTitle = UIImageView()
        avatarTitle.translatesAutoresizingMaskIntoConstraints = false
        avatarTitle.image = UIImage(named: "") ?? UIImage()
        avatarTitle.layer.cornerRadius = 5
        avatarTitle.contentMode = .scaleAspectFit
        avatarTitle.clipsToBounds = true
        avatarTitle.backgroundColor = .red
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
    }
    func addSub(){
        self.addSubview(containerView)
        containerView.addSubview(titleNewLabel)
        containerView.addSubview(contentLabel)
        containerView.addSubview(timerLabel)
        containerView.addSubview(titleNewLabel)
        containerView.addSubview(issue)
    }
    func setLayout(){
        containerView.topAnchor.constraint(equalTo: self.topAnchor, constant: 8).isActive = true
        containerView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20).isActive = true
        containerView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20).isActive = true
        containerView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -5).isActive = true
        
        titleNewLabel.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 3).isActive = true
        titleNewLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 30).isActive = true
        titleNewLabel.widthAnchor.constraint(equalTo: containerView.widthAnchor, multiplier: 0.8, constant: 0).isActive = true
        titleNewLabel.heightAnchor.constraint(equalTo:containerView.heightAnchor,multiplier: 0.2, constant: 0).isActive = true
        
        contentLabel.topAnchor.constraint(equalTo: titleNewLabel.bottomAnchor,constant: 5).isActive  = true
        contentLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 30).isActive = true
        contentLabel.widthAnchor.constraint(equalTo: containerView.widthAnchor, multiplier: 0.9, constant: 0).isActive = true
        contentLabel.heightAnchor.constraint(equalTo: containerView.heightAnchor,multiplier: 0.3, constant: 0).isActive = true
        
        timerLabel.topAnchor.constraint(equalTo: contentLabel.bottomAnchor,constant: 5).isActive  = true
        timerLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 30).isActive = true
        timerLabel.widthAnchor.constraint(equalTo: timerLabel.widthAnchor, constant: 0).isActive = true
        timerLabel.heightAnchor.constraint(equalToConstant: 15).isActive = true
        
        issue.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 5).isActive = true
        issue.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 10).isActive = true
        issue.heightAnchor.constraint(equalToConstant: 10).isActive = true
        issue.widthAnchor.constraint(equalTo: issue.heightAnchor, constant: 0).isActive = true
    }
}
