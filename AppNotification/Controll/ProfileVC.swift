//
//  ChangePass.swift
//  AppNotification
//
//  Created by namit on 04/12/2020.
//

import UIKit
import Kingfisher
import SwiftyJSON
import SkyFloatingLabelTextField

class ProfileVC: UIViewController {
    let containerview: UIView = {
        let container = UIView()
        container.translatesAutoresizingMaskIntoConstraints = false
        container.backgroundColor = .white
        container.clipsToBounds = true
        return container
    }()
    let stackview: UIStackView = {
        let stackview = UIStackView()
        stackview.translatesAutoresizingMaskIntoConstraints = false
        stackview.backgroundColor = .white
        stackview.layer.cornerRadius = 20
        stackview.clipsToBounds = true
        stackview.backgroundColor = UIColor(red:0.733, green:0.733, blue:0.733, alpha: 1.000).withAlphaComponent(0.5)

        return stackview
    }()
    let logoAvatar: UIImageView = {
        let logo = UIImageView()
        logo.translatesAutoresizingMaskIntoConstraints = false
        logo.frame = CGRect(x: 0, y: 0, width: 240, height: 120)
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
    let tendangnhapLabel: UILabel = {
        let dangnhap = UILabel()
        dangnhap.translatesAutoresizingMaskIntoConstraints = false
        dangnhap.text = "Họ Và Tên"
        dangnhap.font = UIFont.italicSystemFont(ofSize: 17)
        return dangnhap
    }()
    let tenNhanViên: UILabel = {
        let dangnhap = UILabel()
        dangnhap.translatesAutoresizingMaskIntoConstraints = false
        dangnhap.text = "Tên Nhân Viên"
        dangnhap.font = UIFont.italicSystemFont(ofSize: 17)
        return dangnhap
    }()
    let emailLabel: UILabel = {
        let dangnhap = UILabel()
        dangnhap.translatesAutoresizingMaskIntoConstraints = false
        dangnhap.text = "Email"
        dangnhap.font = UIFont.italicSystemFont(ofSize: 17)
        return dangnhap
    }()
    let sodienThoai: UILabel = {
        let dangnhap = UILabel()
        dangnhap.translatesAutoresizingMaskIntoConstraints = false
        dangnhap.text = "Số Điện Thoại"
        dangnhap.font = UIFont.italicSystemFont(ofSize: 17)
        return dangnhap
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
        return titelname
    }()
    
    var titleName: UITextField = {
        let titelname = SkyFloatingLabelTextField()
        titelname.translatesAutoresizingMaskIntoConstraints = false
        titelname.text = ""
        titelname.clipsToBounds = true
        titelname.selectedLineColor = UIColor.white
        titelname.isUserInteractionEnabled = false
        titelname.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: titelname.frame.height))
        titelname.leftViewMode = .always
        titelname.layer.cornerRadius = 15
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
        return titelname
    }()
    let changePasword: UIButton = {
        let register = UIButton()
        register.translatesAutoresizingMaskIntoConstraints = false
        register.setTitle("Change Pasword", for: .normal)
        register.backgroundColor = UIColor(red:0.384, green:0.431, blue:0.831, alpha: 1.000)
        register.layer.cornerRadius = 10
        register.titleLabel?.font = UIFont.init(name: "Times New Roman", size: 19)
        register.setTitleColor(.white, for: .normal)
        return register
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        let back = UIBarButtonItem(image: UIImage.init(systemName: "chevron.left"), style: .done, target: self, action: #selector(quaylai))
        navigationItem.leftBarButtonItem = back
        title = "Thông Tin Tài Khoản"
        self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor(red:0.086, green:0.510, blue:0.973, alpha: 1.000),NSAttributedString.Key.font: UIFont(name: "Times New Roman", size: 19)!]
        addsub(); setLayout()
        DispatchQueue.main.async {
            self.addProfile()
            self.addTarget()
        }
    }
    @objc func quaylai(){
        dismiss(animated: true, completion: nil)
    }
    func addProfile(){
        let urllogo = UserDefaults.standard.string(forKey: "avatar")
        logoAvatar.kf.setImage(with: URL(string: urllogo!))
        let username = UserDefaults.standard.string(forKey: "username")
        titleUserName.text = "\(username!)"
        
        let textnhanvien = UserDefaults.standard.string(forKey: "name")
        titleName.text = "\(textnhanvien!)"
        if UserDefaults.standard.string(forKey: "email") == nil{
            titleEmail.text = "Chưa câp nhật thông tin"
        }else {
            let textEmail = UserDefaults.standard.string(forKey: "email")
            titleEmail.text = "\(textEmail!)"
        }
        if UserDefaults.standard.string(forKey: "phone") == nil{
            titlePhone.text = "Chưa câp nhật thông tin"
        }else {
            let textPhone = UserDefaults.standard.string(forKey: "phone")
            titlePhone.text = "\(textPhone!)"
        }
        
    }
    func addTarget(){
        changePasword.addTarget(self, action: #selector(changPass), for: .touchUpInside)
    }
    func addsub(){
        view.addSubview(containerview)
        containerview.addSubview(stackview)
        stackview.addSubview(logoAvatar)
        stackview.addSubview(tendangnhapLabel)
        stackview.addSubview(titleUserName)
        stackview.addSubview(tenNhanViên)
        stackview.addSubview(titleName)
        stackview.addSubview(emailLabel)
        stackview.addSubview(titleEmail)
        stackview.addSubview(sodienThoai)
        stackview.addSubview(titlePhone)
        stackview.addSubview(changePasword)
        
    }
    func setLayout(){
        containerview.topAnchor.constraint(equalTo:view.layoutMarginsGuide.topAnchor, constant: 0).isActive = true
        containerview.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0).isActive = true
        containerview.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0).isActive = true
        containerview.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0).isActive = true
        
        stackview.topAnchor.constraint(equalTo: containerview.topAnchor, constant:  20).isActive = true
        stackview.leadingAnchor.constraint(equalTo: containerview.leadingAnchor, constant: 20).isActive = true
        stackview.trailingAnchor.constraint(equalTo: containerview.trailingAnchor, constant: -20).isActive = true
        stackview.bottomAnchor.constraint(equalTo: containerview.bottomAnchor, constant: -20).isActive = true
        
        logoAvatar.centerXAnchor.constraint(equalTo: stackview.centerXAnchor, constant: 0).isActive = true
        logoAvatar.topAnchor.constraint(equalTo: stackview.topAnchor, constant: 10).isActive = true
        logoAvatar.widthAnchor.constraint(equalToConstant: logoAvatar.frame.width/2).isActive = true
        logoAvatar.heightAnchor.constraint(equalTo: logoAvatar.widthAnchor, constant: 0).isActive = true
        
        tendangnhapLabel.topAnchor.constraint(equalTo: logoAvatar.bottomAnchor, constant:  50).isActive = true
        tendangnhapLabel.leadingAnchor.constraint(equalTo: stackview.leadingAnchor, constant: 30).isActive = true
        tendangnhapLabel.trailingAnchor.constraint(equalTo: stackview.trailingAnchor, constant: -20).isActive = true
        
        titleUserName.topAnchor.constraint(equalTo: tendangnhapLabel.bottomAnchor, constant: -5).isActive = true
        titleUserName.leadingAnchor.constraint(equalTo: stackview.leadingAnchor, constant: 20).isActive = true
        titleUserName.trailingAnchor.constraint(equalTo: stackview.trailingAnchor, constant: -20).isActive = true
        
        tenNhanViên.topAnchor.constraint(equalTo: tendangnhapLabel.bottomAnchor, constant:  50).isActive = true
        tenNhanViên.leadingAnchor.constraint(equalTo: stackview.leadingAnchor, constant: 30).isActive = true
        tenNhanViên.trailingAnchor.constraint(equalTo: stackview.trailingAnchor, constant: -20).isActive = true
        
        titleName.topAnchor.constraint(equalTo: tenNhanViên.bottomAnchor, constant: -5).isActive = true
        titleName.leadingAnchor.constraint(equalTo: stackview.leadingAnchor, constant: 20).isActive = true
        titleName.trailingAnchor.constraint(equalTo: stackview.trailingAnchor, constant: -20).isActive = true
        
        emailLabel.topAnchor.constraint(equalTo: tenNhanViên.bottomAnchor, constant:  50).isActive = true
        emailLabel.leadingAnchor.constraint(equalTo: stackview.leadingAnchor, constant: 30).isActive = true
        emailLabel.trailingAnchor.constraint(equalTo: stackview.trailingAnchor, constant: -20).isActive = true
        
        titleEmail.topAnchor.constraint(equalTo: emailLabel.bottomAnchor, constant: -5).isActive = true
        titleEmail.leadingAnchor.constraint(equalTo: stackview.leadingAnchor, constant: 20).isActive = true
        titleEmail.trailingAnchor.constraint(equalTo: stackview.trailingAnchor, constant: -20).isActive = true
        
        sodienThoai.topAnchor.constraint(equalTo: emailLabel.bottomAnchor, constant:  50).isActive = true
        sodienThoai.leadingAnchor.constraint(equalTo: stackview.leadingAnchor, constant: 30).isActive = true
        sodienThoai.trailingAnchor.constraint(equalTo: stackview.trailingAnchor, constant: -20).isActive = true
        
        titlePhone.topAnchor.constraint(equalTo: sodienThoai.bottomAnchor, constant: -5).isActive = true
        titlePhone.leadingAnchor.constraint(equalTo: stackview.leadingAnchor, constant: 20).isActive = true
        titlePhone.trailingAnchor.constraint(equalTo: stackview.trailingAnchor, constant: -20).isActive = true
        
        changePasword.topAnchor.constraint(equalTo:titlePhone.bottomAnchor, constant: 30).isActive = true
        changePasword.widthAnchor.constraint(equalToConstant: 180).isActive = true
        changePasword.heightAnchor.constraint(equalTo: titlePhone.heightAnchor, constant: 0).isActive = true
        changePasword.centerXAnchor.constraint(equalTo: stackview.centerXAnchor, constant: 0).isActive = true
        
    }
    @objc func changPass(){
        let changPassVC = ChangPassVC()
        let navigationController = UINavigationController.init(rootViewController: changPassVC)
        navigationController.modalPresentationStyle = .fullScreen
        self.present(navigationController, animated: true, completion: nil)
    print("go edit")
    }
}
