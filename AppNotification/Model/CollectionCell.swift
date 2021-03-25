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
        let container = UIView()
        container.translatesAutoresizingMaskIntoConstraints = false
        container.layer.cornerRadius = 15
        return container
    }()
    var label: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.numberOfLines = 0
        label.font = UIFont.init(name: "Arial", size: 17)
        return label
    }()
    var image : UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(named: "")
        image.contentMode = .scaleToFill
        image.clipsToBounds = true
        return image
    }()
    let badge: UILabel = {
        let badge = UILabel()
        badge.translatesAutoresizingMaskIntoConstraints = false
        badge.textAlignment = .center
        badge.text = ""
        badge.backgroundColor = .red
        badge.textColor = .white
        badge.font = UIFont.boldSystemFont(ofSize: 15)
        badge.layer.cornerRadius = 5
        badge.clipsToBounds = true
//        badge.numberOfLines = 1
        badge.preferredMaxLayoutWidth = 150
        badge.minimumScaleFactor = 0.5
        badge.sizeToFit()
        return badge
    }()

    override init(frame: CGRect) {
        super .init(frame: frame)
        addSubview()
        setLayout()
//        colorBacground()
    }
    func colorBacground(){
        let gardient = CAGradientLayer()
        gardient.frame = CGRect(x: 0, y: 0, width: badge.frame.width, height: badge.frame.height)
        gardient.startPoint = CGPoint(x: 0, y: 1)
        gardient.endPoint = CGPoint(x: 1, y: 1)
        gardient.colors = [UIColor(red: 0.48, green: 0.84, blue: 0.96, alpha: 1.00).cgColor,UIColor(red: 0.47, green: 0.50, blue: 0.96, alpha: 1.00).cgColor]
        badge.layer.insertSublayer(gardient, at: 0)

    }
    func addSubview() {
        self.addSubview(container)
        container.addSubview(label)
        container.addSubview(image)
//        container.addSubview(badge)
    }
    func setLayout(){
        container.topAnchor.constraint(equalTo: self.topAnchor, constant: 0).isActive = true
        container.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 0).isActive = true
        container.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: 0).isActive = true
        container.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: 0).isActive = true
        container.heightAnchor.constraint(equalToConstant: 120).isActive = true
        container.widthAnchor.constraint(equalToConstant: 120).isActive = true
        
        label.topAnchor.constraint(equalTo: image.bottomAnchor, constant: 5).isActive = true
        label.leadingAnchor.constraint(equalTo: container.leadingAnchor, constant: 10).isActive = true
        label.trailingAnchor.constraint(equalTo: container.trailingAnchor, constant: -10).isActive = true
        label.bottomAnchor.constraint(equalTo: container.bottomAnchor, constant: -10).isActive = true
        
        image.centerXAnchor.constraint(equalTo: container.centerXAnchor, constant: 0).isActive = true
        image.centerYAnchor.constraint(equalTo: container.centerYAnchor, constant: -20).isActive = true
        image.widthAnchor.constraint(equalToConstant: 50).isActive = true
        image.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
//        badge.topAnchor.constraint(equalTo: container.topAnchor, constant: 4).isActive = true
//        badge.trailingAnchor.constraint(equalTo: container.trailingAnchor, constant: -10).isActive = true
//        badge.widthAnchor.constraint(equalToConstant: badge.bounds.size.width).isActive = true
//        badge.heightAnchor.constraint(equalToConstant: 16).isActive = true
    
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

