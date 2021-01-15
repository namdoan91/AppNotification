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
        container.backgroundColor = UIColor(red: 0.96, green: 0.96, blue: 0.96, alpha: 1.00)
        container.clipsToBounds = true
        return container
    }()
    let stackview: UIStackView = {
        let stackview = UIStackView()
        stackview.translatesAutoresizingMaskIntoConstraints = false
        stackview.layer.cornerRadius = 20
        stackview.clipsToBounds = true
        stackview.backgroundColor = UIColor(red: 0.33, green: 0.64, blue: 0.94, alpha: 1.00)
        return stackview
    }()
    
    let stackview2: UIStackView = {
        let stackview = UIStackView()
        stackview.translatesAutoresizingMaskIntoConstraints = false
        stackview.layer.cornerRadius = 20
        stackview.clipsToBounds = true
        stackview.backgroundColor = UIColor.white
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

    var titletenDangNhap: UITextField = {
        let titelname = UITextField()
        titelname.translatesAutoresizingMaskIntoConstraints = false
//        titelname.text = "Chưa có thông tin"
//        titelname.clipsToBounds = true
        titelname.isUserInteractionEnabled = false
        titelname.textAlignment = .left
        titelname.textColor = .black
        titelname.font = UIFont.init(name: "TimesNewRomanPSMT", size: 21)!
        return titelname
    }()
    var titleDangNhap: UILabel = {
        let titelname = UILabel()
        titelname.translatesAutoresizingMaskIntoConstraints = false
        titelname.text = "Tên Đăng Nhập"
        titelname.numberOfLines = 0
        titelname.font = UIFont.init(name: "TimesNewRomanPSMT", size: 21)!
        titelname.textColor = UIColor(red: 0.57, green: 0.57, blue: 0.57, alpha: 1.00)
        return titelname
    }()
    
    var titleUserName: UITextField = {
        let titelname = UITextField()
        titelname.translatesAutoresizingMaskIntoConstraints = false
        titelname.text = "Chưa có thông tin"
//        titelname.clipsToBounds = true
        titelname.isUserInteractionEnabled = false
        titelname.textAlignment = .center
        titelname.textColor = .black
        titelname.font = UIFont.init(name: "TimesNewRomanPSMT", size: 21)!
        return titelname
    }()
    var titlename: UILabel = {
        let titelname = UILabel()
        titelname.translatesAutoresizingMaskIntoConstraints = false
        titelname.text = "Họ và Tên Nhân Viên:"
        titelname.numberOfLines = 0
        titelname.font = UIFont.init(name: "TimesNewRomanPSMT", size: 21)!
        titelname.textColor = UIColor(red: 0.57, green: 0.57, blue: 0.57, alpha: 1.00)
        return titelname
    }()
    var titleUserName2: UILabel = {
        let titelname = UILabel()
        titelname.translatesAutoresizingMaskIntoConstraints = false
        titelname.text = "Chưa có thông tin"
        titelname.clipsToBounds = true
        titelname.isUserInteractionEnabled = false
//        titelname.selectedLineColor = UIColor.black
        titelname.textAlignment = .left
        titelname.textColor = .black
        titelname.font = UIFont.init(name: "TimesNewRomanPSMT", size: 21)!
        return titelname
    }()
    var titleaddress: UILabel = {
        let titelname = UILabel()
        titelname.translatesAutoresizingMaskIntoConstraints = false
        titelname.text = "Địa chỉ Công Ty:"
        titelname.numberOfLines = 0
        titelname.font = UIFont.init(name: "TimesNewRomanPSMT", size: 21)!
        titelname.textColor = UIColor(red: 0.57, green: 0.57, blue: 0.57, alpha: 1.00)
        return titelname
    }()
    var addressTest: UILabel = {
        let titelname = UILabel()
        titelname.translatesAutoresizingMaskIntoConstraints = false
        titelname.text = "Số 9, ĐL Độc Lập,Phường Bình Hoà,\n TP. Thuận An, Bình Dương"
        titelname.clipsToBounds = true
        titelname.numberOfLines = 0
        titelname.font = UIFont.init(name: "TimesNewRomanPSMT", size: 21)!
        
        titelname.textColor = .black
        return titelname
    }()
    var titlenmail: UILabel = {
        let titelname = UILabel()
        titelname.translatesAutoresizingMaskIntoConstraints = false
        titelname.text = "Email:"
        titelname.numberOfLines = 0
        titelname.font = UIFont.init(name: "TimesNewRomanPSMT", size: 21)!
        titelname.textColor = UIColor(red: 0.57, green: 0.57, blue: 0.57, alpha: 1.00)
        return titelname
    }()
    var titleEmail: UILabel = {
        let titelname = UILabel()
        titelname.translatesAutoresizingMaskIntoConstraints = false
        titelname.text = "Chưa có thông tin"
        titelname.clipsToBounds = true
//       titelname.selectedLineColor = UIColor.white
        titelname.isUserInteractionEnabled = false
//        titelname.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: titelname.frame.height))
//        titelname.leftViewMode = .always
//        titelname.layer.cornerRadius = 15
        titelname.textColor = .black
        titelname.font = UIFont.init(name: "TimesNewRomanPSMT", size: 21)!
        return titelname
    }()
    var titlephone: UILabel = {
        let titelname = UILabel()
        titelname.translatesAutoresizingMaskIntoConstraints = false
        titelname.text = "Số Điện Thoại:"
        titelname.numberOfLines = 0
        titelname.font = UIFont.init(name: "TimesNewRomanPSMT", size: 21)!
        titelname.textColor = UIColor(red: 0.57, green: 0.57, blue: 0.57, alpha: 1.00)
        return titelname
    }()
    var titlePhone: UILabel = {
        let titelname = UILabel()
        titelname.translatesAutoresizingMaskIntoConstraints = false
        titelname.text = "Chưa có thông tin"
        titelname.clipsToBounds = true
//        titelname.selectedLineColor = UIColor.white
        titelname.isUserInteractionEnabled = false
        titelname.font = UIFont.init(name: "TimesNewRomanPSMT", size: 21)!
        titelname.textColor = .black
        return titelname
    }()
    var dataProfile: checkSession!
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor(red:0.086, green:0.510, blue:0.973, alpha: 1.000),NSAttributedString.Key.font: UIFont(name: "Arial", size: 19)!]
        navigationController!.navigationBar.setBackgroundImage(UIImage(), for: .default)
        navigationController!.navigationBar.shadowImage = UIImage()
        navigationController?.navigationBar.isTranslucent = true
        navigationController?.navigationBar.backgroundColor = .clear
//        view.backgroundColor = .white
        navigationItem.title = "Thông Tin Tài Khoản"
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
            strongSelf.titleUserName.text = strongSelf.dataProfile.name
            strongSelf.titleUserName2.text = strongSelf.dataProfile.name
            strongSelf.titlePhone.text = strongSelf.dataProfile.phone
            strongSelf.titletenDangNhap.text = strongSelf.dataProfile.username
        }failure: { (code) in
            self.showAlert(alertText: code, alertMessage: "Thông Tin Đăng Nhập Lỗi.")
        }
    }
    func addsub(){
        view.addSubview(containerview)
        containerview.addSubview(stackview)
        containerview.addSubview(stackview2)
        stackview.addSubview(logoAvatar)
        stackview.addSubview(titleUserName)
        
        stackview2.addSubview(titleDangNhap)
        stackview2.addSubview(titletenDangNhap)
        stackview2.addSubview(titlename)
        stackview2.addSubview(titleUserName2)
        stackview2.addSubview(titlephone)
        stackview2.addSubview(titlePhone)
        stackview2.addSubview(titlenmail)
        stackview2.addSubview(titleEmail)
        stackview2.addSubview(titleaddress)
        stackview2.addSubview(addressTest)
    }
    func setLayout(){
        containerview.topAnchor.constraint(equalTo:view.topAnchor, constant: 0).isActive = true
        containerview.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0).isActive = true
        containerview.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0).isActive = true
        containerview.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0).isActive = true
        
        stackview.topAnchor.constraint(equalTo: view.layoutMarginsGuide.topAnchor, constant:  0).isActive = true
        stackview.leadingAnchor.constraint(equalTo: containerview.leadingAnchor, constant: 20).isActive = true
        stackview.trailingAnchor.constraint(equalTo: containerview.trailingAnchor, constant: -20).isActive = true
        stackview.heightAnchor.constraint(equalToConstant: 180).isActive = true
        
        logoAvatar.centerYAnchor.constraint(equalTo: stackview.centerYAnchor, constant: -10).isActive = true
        logoAvatar.centerXAnchor.constraint(equalTo: stackview.centerXAnchor, constant: 0).isActive = true
        logoAvatar.widthAnchor.constraint(equalToConstant: logoAvatar.frame.width/2).isActive = true
        logoAvatar.heightAnchor.constraint(equalTo: logoAvatar.widthAnchor, constant: 0).isActive = true

        titleUserName.topAnchor.constraint(equalTo: logoAvatar.bottomAnchor, constant: 5).isActive = true
        titleUserName.centerXAnchor.constraint(equalTo: logoAvatar.centerXAnchor, constant: 0).isActive = true
        titleUserName.widthAnchor.constraint(equalToConstant: 300).isActive = true
        titleUserName.heightAnchor.constraint(equalTo: titleUserName.heightAnchor, constant: 0).isActive = true
        
        ///stack view 2
        stackview2.topAnchor.constraint(equalTo: stackview.bottomAnchor, constant:  30).isActive = true
        stackview2.leadingAnchor.constraint(equalTo: containerview.leadingAnchor, constant: 20).isActive = true
        stackview2.trailingAnchor.constraint(equalTo: containerview.trailingAnchor, constant: -20).isActive = true
        stackview2.bottomAnchor.constraint(equalTo:view.layoutMarginsGuide.bottomAnchor, constant: -10).isActive = true
        
        titleDangNhap.topAnchor.constraint(equalTo: stackview2.topAnchor, constant: 20).isActive = true
        titleDangNhap.leadingAnchor.constraint(equalTo: stackview2.leadingAnchor, constant: 15).isActive = true
        titleDangNhap.trailingAnchor.constraint(equalTo:stackview2.trailingAnchor,constant: -15).isActive = true
        titleDangNhap.heightAnchor.constraint(equalToConstant: 30).isActive = true
        
        titletenDangNhap.topAnchor.constraint(equalTo: titleDangNhap.bottomAnchor, constant: 5).isActive = true
        titletenDangNhap.leadingAnchor.constraint(equalTo: stackview2.leadingAnchor, constant: 15).isActive = true
        titletenDangNhap.trailingAnchor.constraint(equalTo:stackview2.trailingAnchor,constant: -15).isActive = true
        titletenDangNhap.heightAnchor.constraint(equalTo:titleDangNhap.heightAnchor).isActive = true
        
        titlename.topAnchor.constraint(equalTo: titletenDangNhap.bottomAnchor, constant: 10).isActive = true
        titlename.leadingAnchor.constraint(equalTo: stackview2.leadingAnchor, constant: 15).isActive = true
        titlename.trailingAnchor.constraint(equalTo:stackview2.trailingAnchor,constant: -15).isActive = true
        titlename.heightAnchor.constraint(equalToConstant: 30).isActive = true
    
        titleUserName2.topAnchor.constraint(equalTo: titlename.bottomAnchor, constant: 5).isActive = true
        titleUserName2.leadingAnchor.constraint(equalTo: stackview2.leadingAnchor, constant: 15).isActive = true
        titleUserName2.trailingAnchor.constraint(equalTo:stackview2.trailingAnchor,constant: -15).isActive = true
        titleUserName2.heightAnchor.constraint(equalTo:titlename.heightAnchor).isActive = true
        
        titlephone.topAnchor.constraint(equalTo: titleUserName2.bottomAnchor, constant: 10).isActive = true
        titlephone.leadingAnchor.constraint(equalTo: stackview2.leadingAnchor, constant: 15).isActive = true
        titlephone.trailingAnchor.constraint(equalTo:stackview2.trailingAnchor,constant: -15).isActive = true
        titlephone.heightAnchor.constraint(equalTo: titlename.heightAnchor).isActive = true

        titlePhone.topAnchor.constraint(equalTo: titlephone.bottomAnchor, constant:  5).isActive = true
        titlePhone.leadingAnchor.constraint(equalTo: stackview2.leadingAnchor, constant: 15).isActive = true
        titlePhone.trailingAnchor.constraint(equalTo:stackview2.trailingAnchor,constant: -15).isActive = true
        titlePhone.heightAnchor.constraint(equalTo:titlename.heightAnchor).isActive = true
        
        titlenmail.topAnchor.constraint(equalTo: titlePhone.bottomAnchor, constant: 10).isActive = true
        titlenmail.leadingAnchor.constraint(equalTo: stackview2.leadingAnchor, constant: 15).isActive = true
        titlenmail.trailingAnchor.constraint(equalTo:stackview2.trailingAnchor,constant: -15).isActive = true
        titlenmail.heightAnchor.constraint(equalTo: titlename.heightAnchor).isActive = true
        
        titleEmail.topAnchor.constraint(equalTo: titlenmail.bottomAnchor, constant:  5).isActive = true
        titleEmail.leadingAnchor.constraint(equalTo: stackview2.leadingAnchor, constant: 15).isActive = true
        titleEmail.trailingAnchor.constraint(equalTo: stackview2.trailingAnchor, constant: -15).isActive = true
        titleEmail.heightAnchor.constraint(equalTo:titlename.heightAnchor).isActive = true
        
        titleaddress.topAnchor.constraint(equalTo: titleEmail.bottomAnchor, constant: 10).isActive = true
        titleaddress.leadingAnchor.constraint(equalTo: stackview2.leadingAnchor, constant: 15).isActive = true
        titleaddress.trailingAnchor.constraint(equalTo:stackview2.trailingAnchor,constant: -15).isActive = true
        titleaddress.heightAnchor.constraint(equalTo: titlename.heightAnchor).isActive = true

        addressTest.topAnchor.constraint(equalTo: titleaddress.bottomAnchor, constant:  5).isActive = true
        addressTest.trailingAnchor.constraint(equalTo: stackview2.trailingAnchor, constant: -15).isActive = true
        addressTest.leadingAnchor.constraint(equalTo: stackview2.leadingAnchor, constant: 15).isActive = true
        addressTest.heightAnchor.constraint(equalTo:addressTest.heightAnchor).isActive = true

        
    }
    
    
}
