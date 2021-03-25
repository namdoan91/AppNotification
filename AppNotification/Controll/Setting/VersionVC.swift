//
//  VersionVC.swift
//  AppNotification
//
//  Created by namit on 21/12/2020.
//

import UIKit

class VersionVC: UIViewController {
    let contaiverView: UIView = {
        let container = UIView()
        container.translatesAutoresizingMaskIntoConstraints = false
        container.backgroundColor = UIColor(red: 0.867, green: 0.867, blue: 0.867, alpha: 1)
        return container
    }()
    let ScrollView : UIScrollView = {
        let stackview = UIScrollView()
        stackview.translatesAutoresizingMaskIntoConstraints = false
        stackview.backgroundColor = .white
        stackview.layer.cornerRadius = 10
//        stackview.isUserInteractionEnabled = true
        return stackview
    }()

    let contentView : UIView = {
        let contentview = UIView()
        contentview.translatesAutoresizingMaskIntoConstraints = false
//        contentview.backgroundColor = .green
//        contentview.clipsToBounds = true
////        contentview.layer.cornerRadius = 15
//        contentview.layer.shadowRadius = 10
//        contentview.layer.shadowColor = UIColor.blue.withAlphaComponent(0.2).cgColor
//        contentview.layer.shadowOpacity = 50
//        contentview.layer.shadowOffset = CGSize(width: 0, height: 10)
//        contentview.layer.masksToBounds = false
        return contentview
    }()
    let textTieuDe: UILabel = {
        let text = UILabel()
        text.translatesAutoresizingMaskIntoConstraints = false
        text.text = "Version 1.0 - Design by MVP "
        text.font = UIFont.init(name: "TimesNewRomanPSMT", size: 17)
        text.textAlignment = .center
        text.textColor = UIColor(red:0.086, green:0.510, blue:0.973, alpha: 1.000)
        text.textColor = UIColor.white
        return text
    }()
    let logoUIView: UIImageView = {
        let logo = UIImageView(frame: CGRect(x: 0, y: 0, width: 240, height: 240))
        logo.translatesAutoresizingMaskIntoConstraints = false
        logo.image = UIImage(named: "1024")
//        logo.clipsToBounds = true
////        logo.layer.cornerRadius = 15
//        logo.layer.shadowRadius = 10
//        logo.layer.shadowColor = UIColor.blue.withAlphaComponent(0.2).cgColor
//        logo.layer.shadowOpacity = 50
//        logo.layer.shadowOffset = CGSize(width: 0, height: 10)
//        logo.layer.masksToBounds = false
        return logo
    }()
    let textName: UILabel = {
        let text = UILabel()
        text.translatesAutoresizingMaskIntoConstraints = false
        text.text = "MARUEI VIET NAM PRECISION \n CO., LTD"
        text.font = UIFont.init(name: "TimesNewRomanPSMT", size: 24)
        text.textAlignment = .center
        text.numberOfLines = 0
        text.textColor = UIColor.blue
        return text
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor(red:0.086, green:0.510, blue:0.973, alpha: 1.000),NSAttributedString.Key.font: UIFont(name: "Arial", size: 19)!]
        navigationItem.title = "Phiên Bản"
        view.backgroundColor = .white
        addSub(); setlayOut()
        let gardiant = CAGradientLayer()
        gardiant.frame = CGRect(x: 0, y: 0, width: view.frame.width, height: view.frame.height)
        gardiant.colors = [UIColor(red: 102.0/255.0, green: 221.0/255.0, blue: 221.0/255.0, alpha: 1.0).cgColor,UIColor(red: 102.0/255.0, green: 221.0/255.0, blue: 221.0/255.0, alpha: 1.0).cgColor]
        gardiant.startPoint = CGPoint(x: 0, y: 1)
        gardiant.endPoint = CGPoint(x: 1, y: 1)
        ScrollView.layer.insertSublayer(gardiant, at: 0)
        logoUIView.layer.masksToBounds = true
        logoUIView.layer.cornerRadius = 15
    }
    
    func addSub(){
        view.addSubview(contaiverView)
        contaiverView.addSubview(ScrollView)
        ScrollView.addSubview(contentView)
        contentView.addSubview(textTieuDe)
//        contentView.addSubview(textContent)
        contentView.addSubview(logoUIView)
        contentView.addSubview(textName)
    }
    
    func setlayOut(){
        contaiverView.topAnchor.constraint(equalTo: view.layoutMarginsGuide.topAnchor, constant: 0).isActive = true
        contaiverView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0).isActive = true
        contaiverView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0).isActive = true
        contaiverView.bottomAnchor.constraint(equalTo: view.layoutMarginsGuide.bottomAnchor, constant: 0).isActive = true
        
        ScrollView.topAnchor.constraint(equalTo: view.layoutMarginsGuide.topAnchor, constant: 20).isActive = true
        ScrollView.leadingAnchor.constraint(equalTo: contaiverView.leadingAnchor, constant: 10).isActive = true
        ScrollView.trailingAnchor.constraint(equalTo: contaiverView.trailingAnchor, constant: -10).isActive = true
        ScrollView.bottomAnchor.constraint(equalTo: view.layoutMarginsGuide.bottomAnchor, constant: -20).isActive = true
        
        contentView.topAnchor.constraint(equalTo: ScrollView.topAnchor, constant: 0).isActive = true
        contentView.leadingAnchor.constraint(equalTo: ScrollView.leadingAnchor, constant: 0).isActive = true
        contentView.trailingAnchor.constraint(equalTo: ScrollView.trailingAnchor, constant: 0).isActive = true
        contentView.bottomAnchor.constraint(equalTo: ScrollView.bottomAnchor, constant: 0).isActive = true
        contentView.widthAnchor.constraint(equalTo: ScrollView.widthAnchor, constant: 0).isActive = true
        contentView.heightAnchor.constraint(equalTo: ScrollView.heightAnchor, constant: 0).isActive = true
        
        textTieuDe.topAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -30).isActive = true
        textTieuDe.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 0).isActive = true
        textTieuDe.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: 0).isActive = true
        
        logoUIView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 40).isActive = true
        logoUIView.centerXAnchor.constraint(equalTo: contentView.centerXAnchor, constant: 0).isActive = true
//        logoUIView.centerYAnchor.constraint(equalTo: ScrollView.centerYAnchor, constant: 0).isActive = true
        logoUIView.widthAnchor.constraint(equalToConstant: 240).isActive = true
        logoUIView.heightAnchor.constraint(equalToConstant: 240).isActive = true
        
        textName.topAnchor.constraint(equalTo: logoUIView.bottomAnchor, constant: 10).isActive = true
        textName.centerXAnchor.constraint(equalTo: contentView.centerXAnchor, constant: 0).isActive = true
//        textName.heightAnchor.constraint(equalToConstant: 60).isActive = true

        
        
    }
}
