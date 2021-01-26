//
//  CollectionCell.swift
//  AppNotification
//
//  Created by namit on 18/01/2021.
//

import Foundation
import UIKit

class CollectionCell: UICollectionViewCell{
    let container : UIView = {
        let container = UIView(frame: CGRect(x: 0, y: 0, width: 110 , height: 100))
        container.translatesAutoresizingMaskIntoConstraints = false
        container.layer.cornerRadius = 15
        return container
    }()
    var label: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.numberOfLines = 0
        label.font = UIFont.init(name: "Arial", size: 15)
        return label
    }()
    let image : UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(named: "Image-5")
        image.contentMode = .scaleToFill
        image.clipsToBounds = true
        return image
    }()
    let badge: UILabel = {
        let badge = UILabel()
        badge.translatesAutoresizingMaskIntoConstraints = false
        badge.textAlignment = .center
        badge.text = "9/20"
        badge.backgroundColor = .red
        badge.textColor = .black
        badge.font = UIFont.init(name: "Arial", size: 10)
        badge.layer.cornerRadius = 10
        badge.clipsToBounds = true
        return badge
    }()
    override init(frame: CGRect) {
        super .init(frame: frame)
        addSubview()
        setLayout()
    }
    func addSubview() {
        self.addSubview(container)
        container.addSubview(label)
        container.addSubview(image)
        container.addSubview(badge)
    }
    func setLayout(){
        container.topAnchor.constraint(equalTo: self.topAnchor, constant: 0).isActive = true
        container.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 0).isActive = true
        container.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: 0).isActive = true
        container.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: 0).isActive = true
        container.heightAnchor.constraint(equalToConstant: 100).isActive = true
        container.widthAnchor.constraint(equalToConstant: 110).isActive = true
        
        label.topAnchor.constraint(equalTo: image.bottomAnchor, constant: 10).isActive = true
        label.leadingAnchor.constraint(equalTo: container.leadingAnchor, constant: 10).isActive = true
        label.trailingAnchor.constraint(equalTo: container.trailingAnchor, constant: -10).isActive = true
        label.bottomAnchor.constraint(equalTo: container.bottomAnchor, constant: -10).isActive = true
        
        image.centerXAnchor.constraint(equalTo: container.centerXAnchor, constant: 0).isActive = true
        image.centerYAnchor.constraint(equalTo: container.centerYAnchor, constant: -20).isActive = true
        image.widthAnchor.constraint(equalToConstant: 20).isActive = true
        image.heightAnchor.constraint(equalToConstant: 20).isActive = true
        
        badge.centerXAnchor.constraint(equalTo: container.centerXAnchor, constant: 40).isActive = true
        badge.centerYAnchor.constraint(equalTo: container.centerYAnchor, constant: -40).isActive = true
        badge.widthAnchor.constraint(equalToConstant: 30).isActive = true
        badge.heightAnchor.constraint(equalToConstant: 20).isActive = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

