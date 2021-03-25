//
//  cellSupport.swift
//  AppNotification
//
//  Created by namit on 28/12/2020.
//

import UIKit

class cellSupport: UITableViewCell {
    let containerView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor.blue.withAlphaComponent(0.5)
//        view.layer.cornerRadius = 15
        return view
    }()
    var titleMSNV: UILabel = {
        let titleNewLabel = UILabel()
        titleNewLabel.translatesAutoresizingMaskIntoConstraints = false
        titleNewLabel.textColor = .white
        titleNewLabel.font = UIFont.boldSystemFont(ofSize: 19)
        titleNewLabel.textAlignment = .left
        return titleNewLabel
    }()
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        addSub()
        setLayout()
    }
    func addSub(){
        self.addSubview(containerView)
        containerView.addSubview(titleMSNV)

    
    }
    func setLayout(){
        containerView.topAnchor.constraint(equalTo: self.topAnchor, constant: 0).isActive = true
        containerView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 0).isActive = true
        containerView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: 0).isActive = true
        containerView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: 0).isActive = true
        titleMSNV.centerYAnchor.constraint(equalTo: containerView.centerYAnchor, constant: 10).isActive = true
        titleMSNV.centerXAnchor.constraint(equalTo: containerView.centerXAnchor, constant: 10).isActive = true

    }
}

