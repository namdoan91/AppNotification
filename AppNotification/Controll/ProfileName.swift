//
//  ProfileName.swift
//  AppNotification
//
//  Created by namit on 16/12/2020.
//

import UIKit
import SkyFloatingLabelTextField
import Alamofire
import SwiftyJSON

class ProfileName: UIViewController {
    deinit {
        print("Huỷ ProfileNameViewController")
    }
    let containerview: UIView = {
        let container = UIView()
        container.translatesAutoresizingMaskIntoConstraints = false
        container.backgroundColor = UIColor(red:0.671, green:0.635, blue:0.522, alpha: 1.000)
        container.clipsToBounds = true
        return container
    }()
    let stackview: UIStackView = {
        let stackview = UIStackView()
        stackview.translatesAutoresizingMaskIntoConstraints = false
        stackview.backgroundColor = .white
        stackview.layer.cornerRadius = 20
        stackview.clipsToBounds = true
        stackview.backgroundColor = UIColor(red:0.671, green:0.635, blue:0.522, alpha: 1.000)
        return stackview
    }()
    let logoAvatar: UIImageView = {
        let logo = UIImageView()
        logo.translatesAutoresizingMaskIntoConstraints = false
        logo.frame = CGRect(x: 0, y: 0, width: 180, height: 90)
        logo.layer.cornerRadius = logo.frame.height/2
        logo.clipsToBounds = true
        logo.contentMode = .scaleAspectFill
        logo.backgroundColor = .blue
        logo.layer.shadowOffset = CGSize(width: 30, height: 30)
        logo.layer.shadowOpacity = 50
        logo.layer.shadowRadius = 50
        logo.layer.shadowColor = UIColor.lightGray.cgColor
        logo.layer.masksToBounds = true
        return logo
    }()
    let logoMVP: UIImageView = {
        let logo = UIImageView()
        logo.translatesAutoresizingMaskIntoConstraints = false
        logo.clipsToBounds = true
        logo.contentMode = .scaleAspectFit
        logo.image = UIImage(named: "logo")
        logo.backgroundColor = .clear
        return logo
    }()
    var titleUserName: UITextField = {
        let titelname = SkyFloatingLabelTextField()
        titelname.translatesAutoresizingMaskIntoConstraints = false
        titelname.text = "Chưa có thông tin"
        titelname.clipsToBounds = true
        titelname.selectedLineColor = UIColor.systemGreen
        titelname.isUserInteractionEnabled = false
        titelname.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: titelname.frame.height))
        titelname.leftViewMode = .always
        titelname.layer.cornerRadius = 15
        titelname.textColor = .white
        titelname.font = UIFont.init(name: "Times New Roman", size: 21)!
        return titelname
    }()
//
    var addressTest: UILabel = {
        let titelname = UILabel()
        titelname.translatesAutoresizingMaskIntoConstraints = false
        titelname.text = "Số 9, ĐL Độc Lập,Phường Bình Hoà, TP. Thuận An, Bình Dương"
        titelname.numberOfLines = 0
        titelname.font = UIFont.init(name: "Times New Roman", size: 15)!
        titelname.textColor = .white
        return titelname
    }()
    var titleEmail: UITextField = {
        let titelname = SkyFloatingLabelTextField()
        titelname.translatesAutoresizingMaskIntoConstraints = false
        titelname.text = "Chưa có thông tin"
        titelname.clipsToBounds = true
        titelname.selectedLineColor = UIColor.white
        titelname.isUserInteractionEnabled = false
        titelname.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: titelname.frame.height))
        titelname.leftViewMode = .always
        titelname.layer.cornerRadius = 15
        titelname.textColor = .white
        titelname.font = UIFont.init(name: "Times New Roman", size: 15)!
        return titelname
    }()
    var titlePhone: UITextField = {
        let titelname = SkyFloatingLabelTextField()
        titelname.translatesAutoresizingMaskIntoConstraints = false
        titelname.text = "Chưa có thông tin"
        titelname.clipsToBounds = true
        titelname.selectedLineColor = UIColor.white
        titelname.isUserInteractionEnabled = false
        titelname.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: titelname.frame.height))
        titelname.leftViewMode = .always
        titelname.layer.cornerRadius = 15
        titelname.font = UIFont.init(name: "Times New Roman", size: 15)!
        titelname.textColor = .white
        return titelname
    }()
    var dataProfile: checkSession!
    
    var background: UIImageView = {
        let background = UIImageView()
        background.translatesAutoresizingMaskIntoConstraints = false
        background.image = UIImage.init(named: "backgound")
        background.clipsToBounds = true
        background.contentMode = .scaleAspectFit
        return background
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor(red:0.086, green:0.510, blue:0.973, alpha: 1.000),NSAttributedString.Key.font: UIFont(name: "Arial", size: 19)!]
        view.backgroundColor = .systemPink
        addsub();setLayout()
        DispatchQueue.main.async {
            self.checkSession()
        }
    }
    func checkSession(){
        ApiManager.shared.checkSession { [weak self] (_ data) in
            guard let strongSelf = self else {return}
            strongSelf.dataProfile = data
            strongSelf.titleEmail.text = strongSelf.dataProfile.email
            strongSelf.logoAvatar.setImage(urlString: strongSelf.dataProfile.avatar!)
//            strongSelf.titleName.text = strongSelf.dataProfile.username
            strongSelf.titleUserName.text = strongSelf.dataProfile.name
            strongSelf.titlePhone.text = strongSelf.dataProfile.phone
        }failure: { (code) in
            self.showAlert(alertText: code, alertMessage: "Thông Tin Đăng Nhập Lỗi.")
        }
    }
    func addsub(){
        view.addSubview(containerview)
        containerview.addSubview(stackview)
        stackview.addSubview(background)
        background.addSubview(logoAvatar)
        background.addSubview(titleUserName)
        background.addSubview(titleEmail)
        background.addSubview(addressTest)
        background.addSubview(titlePhone)
//        background.addSubview(logoMVP)
        
        
    }
    func setLayout(){
        containerview.topAnchor.constraint(equalTo:view.layoutMarginsGuide.topAnchor, constant: 0).isActive = true
        containerview.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0).isActive = true
        containerview.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0).isActive = true
        containerview.bottomAnchor.constraint(equalTo: view.layoutMarginsGuide.bottomAnchor, constant: 0).isActive = true
        
        stackview.topAnchor.constraint(equalTo: containerview.topAnchor, constant:  20).isActive = true
        stackview.leadingAnchor.constraint(equalTo: containerview.leadingAnchor, constant: 20).isActive = true
        stackview.trailingAnchor.constraint(equalTo: containerview.trailingAnchor, constant: -20).isActive = true
        stackview.bottomAnchor.constraint(equalTo: containerview.bottomAnchor, constant: -20).isActive = true
        
        background.topAnchor.constraint(equalTo: containerview.topAnchor, constant:  20).isActive = true
        background.leadingAnchor.constraint(equalTo: containerview.leadingAnchor, constant: 20).isActive = true
        background.trailingAnchor.constraint(equalTo: containerview.trailingAnchor, constant: -20).isActive = true
        background.bottomAnchor.constraint(equalTo: containerview.bottomAnchor, constant: -20).isActive = true
        
        logoAvatar.leadingAnchor.constraint(equalTo: background.leadingAnchor, constant: 15).isActive = true
        logoAvatar.centerYAnchor.constraint(equalTo: background.centerYAnchor, constant: 120).isActive = true
        logoAvatar.widthAnchor.constraint(equalToConstant: logoAvatar.frame.width/2).isActive = true
        logoAvatar.heightAnchor.constraint(equalTo: logoAvatar.widthAnchor, constant: 0).isActive = true

        titleUserName.trailingAnchor.constraint(equalTo: background.trailingAnchor, constant: -35).isActive = true
        titleUserName.centerYAnchor.constraint(equalTo: background.centerYAnchor, constant: 60).isActive = true
        titleUserName.widthAnchor.constraint(equalToConstant: 200).isActive = true
        titleUserName.heightAnchor.constraint(equalTo: titleUserName.heightAnchor, constant: 0).isActive = true
        
        titlePhone.topAnchor.constraint(equalTo: titleUserName.bottomAnchor, constant:  5).isActive = true

        titlePhone.trailingAnchor.constraint(equalTo: stackview.trailingAnchor, constant: -35).isActive = true
        titlePhone.widthAnchor.constraint(equalToConstant: 200).isActive = true
        
        titleEmail.topAnchor.constraint(equalTo: titlePhone.bottomAnchor, constant:  -10).isActive = true

        titleEmail.trailingAnchor.constraint(equalTo: stackview.trailingAnchor, constant: -35).isActive = true
        titleEmail.widthAnchor.constraint(equalToConstant: 200).isActive = true
        
        addressTest.topAnchor.constraint(equalTo: titleEmail.bottomAnchor, constant:  5).isActive = true

        addressTest.trailingAnchor.constraint(equalTo: stackview.trailingAnchor, constant: -35).isActive = true
        addressTest.widthAnchor.constraint(equalToConstant: 190).isActive = true
        
//        logoMVP.topAnchor.constraint(equalTo: background.topAnchor, constant: 150).isActive = true
//        logoMVP.centerXAnchor.constraint(equalTo: background.centerXAnchor, constant: 0).isActive = true
//        logoMVP.widthAnchor.constraint(equalToConstant: 80).isActive = true
//        logoMVP.heightAnchor.constraint(equalToConstant: 80).isActive = true
        
    }
    
    
}
