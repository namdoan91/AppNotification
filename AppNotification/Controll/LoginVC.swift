//
//  LoginVC.swift
//  AppNotification
//
//  Created by namit on 03/12/2020.
//

import UIKit
import Alamofire
import SwiftyJSON
import TextFieldEffects
import SVProgressHUD

class LoginVC: UIViewController {
    let containerView: UIView = {
        let container = UIView()
        container.backgroundColor = UIColor.white
        container.translatesAutoresizingMaskIntoConstraints = false
        return container
    }()
    let topview: UIImageView = {
        let topview = UIImageView()
        topview.translatesAutoresizingMaskIntoConstraints = false
        topview.image = UIImage(named: "Image-1")
        return topview
    }()
    let topview1: UIImageView = {
        let topview = UIImageView()
        topview.translatesAutoresizingMaskIntoConstraints = false
        topview.image = UIImage(named: "Image-2")
        return topview
    }()
    let bottomview: UIImageView = {
        let topview = UIImageView()
        topview.translatesAutoresizingMaskIntoConstraints = false
        topview.image = UIImage(named: "Image-4")
        return topview
    }()
    let welcome: UILabel = {
        let welcome = UILabel()
        welcome.translatesAutoresizingMaskIntoConstraints = false
        welcome.text = "WELCOME BACK APP NOTIFICATION"
        welcome.textAlignment = .center
        welcome.textColor = UIColor.blue
        welcome.font = UIFont.init(name: "TimesNewRomanPSMT", size: 34)
        welcome.numberOfLines = 0
        return welcome
    }()
    let dangNhapText: TextFieldEffects = {
        let dangnhap = KaedeTextField()
        dangnhap.translatesAutoresizingMaskIntoConstraints = false
        dangnhap.setIcon(UIImage(systemName: "person.fill")!)
        dangnhap.placeholder = "Mã Số Nhân Viên"
        dangnhap.backgroundColor = UIColor(red:1.000, green:1.000, blue:1.000, alpha: 1.000)
        dangnhap.leftViewMode = .unlessEditing
        dangnhap.layer.cornerRadius = 30
        dangnhap.foregroundColor = UIColor.gray.withAlphaComponent(0.5)
        dangnhap.clearButtonMode = .always
        dangnhap.textAlignment = .right
        dangnhap.clipsToBounds = true
        dangnhap.placeholderColor = .white
        return dangnhap
    }()
    let matkhatText: UITextField = {
        let dangnhap = KaedeTextField()
        dangnhap.translatesAutoresizingMaskIntoConstraints = false
        dangnhap.setIcon(UIImage(systemName: "lock.fill")!)
        dangnhap.placeholder = "Mật Khẩu Của Bạn"
        dangnhap.backgroundColor = UIColor(red:1.000, green:1.000, blue:1.000, alpha: 1.000)
        dangnhap.leftViewMode = .unlessEditing
        dangnhap.layer.cornerRadius = 30
        dangnhap.foregroundColor = UIColor.gray.withAlphaComponent(0.5)
        dangnhap.clearsOnBeginEditing = true
        dangnhap.textAlignment = .right
        dangnhap.clipsToBounds = true
        dangnhap.isSecureTextEntry = true
        dangnhap.placeholderColor = .white
        dangnhap.clearsOnInsertion = true
        return dangnhap
    }()
    let dangNhapbtnLogin: UIButton = {
        let dangnhap = UIButton()
        dangnhap.translatesAutoresizingMaskIntoConstraints = false
        dangnhap.backgroundColor = UIColor(red:0.518, green:0.604, blue:1.000, alpha: 1.000)
        dangnhap.setTitle("ĐĂNG NHẬP", for: .normal)
        dangnhap.setTitleColor(UIColor.white, for: .normal)
        dangnhap.titleLabel?.font = UIFont.init(name: "TimesNewRomanPSMT", size: 24)
        dangnhap.layer.cornerRadius = 30
        dangnhap.clipsToBounds = true
        return dangnhap
    } ()
    let qmkButton: UIButton = {
        let dangnhap = UIButton()
        dangnhap.translatesAutoresizingMaskIntoConstraints = false
        dangnhap.setTitle("Quên mật khẩu !", for: .normal)
        dangnhap.setTitleColor(UIColor(red:0.518, green:0.604, blue:1.000, alpha: 1.000), for: .normal)
        dangnhap.titleLabel?.font = UIFont.init(name: "TimesNewRomanPSMT", size: 17)
        return dangnhap
    } ()
    let version: UILabel = {
        let welcome = UILabel()
        welcome.translatesAutoresizingMaskIntoConstraints = false
        welcome.text = "Version 1.0.0"
        welcome.textAlignment = .center
        welcome.textColor = UIColor.white
        welcome.font = UIFont.init(name: "TimesNewRomanPSMT", size: 17)
        welcome.numberOfLines = 0
        welcome.layer.shadowColor = UIColor.black.cgColor
        welcome.layer.shadowOffset = CGSize(width: 20, height: 20)
        return welcome
    }()
    let stackView: UIStackView = {
        let stackview = UIStackView()
        stackview.translatesAutoresizingMaskIntoConstraints = false
        stackview.distribution = .fillProportionally
        stackview.backgroundColor = UIColor.white.withAlphaComponent(0.5)
        stackview.clipsToBounds = true
        stackview.layer.cornerRadius = 10
        return stackview
    }()
    let margin:CGFloat = 15
    var getNotification: getNotify?
    var is_seen = [String]()
    var isseen = [String]()
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor?.color(UIColor())
        addSubView(); setLayout(); layer();
        DispatchQueue.main.async {
            self.addTap()
        }
    }
    //MARK: -- TAP DANG NHAP
    func addTap(){
        dangNhapbtnLogin.addTarget(self, action: #selector(btnLogin), for: .touchUpInside)
    }
    func layer(){
        containerView.layer.masksToBounds = false
        containerView.layer.shadowOffset = CGSize(width: 10, height: 10)
        containerView.layer.shadowOpacity = 5
        containerView.layer.shadowRadius = 30
        containerView.layer.shadowColor = UIColor.gray.cgColor
        
        stackView.layer.masksToBounds = false
        stackView.layer.shadowOffset = CGSize(width: 10, height: 10)
        stackView.layer.shadowOpacity = 10
        stackView.layer.shadowRadius = 10
        stackView.layer.shadowColor = UIColor.lightGray.cgColor
    }
    func addSubView(){
        view.addSubview(containerView)
        containerView.addSubview(stackView)
        containerView.addSubview(topview1)
        containerView.addSubview(topview)
        stackView.addSubview(dangNhapText)
        stackView.addSubview(matkhatText)
        stackView.addSubview(dangNhapbtnLogin)
        containerView.addSubview(welcome)
//        containerView.addSubview(qmkButton)
        containerView.addSubview(bottomview)
        containerView.addSubview(version)
    }
    func setLayout(){
        containerView.topAnchor.constraint(equalTo: view.topAnchor, constant: 0).isActive = true
        containerView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0).isActive = true
        containerView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0).isActive = true
        containerView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0).isActive = true
        
        topview.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 0).isActive = true
        topview.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 0).isActive = true
        topview.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: 0).isActive = true
        topview.heightAnchor.constraint(equalToConstant: 80).isActive = true
        
        topview1.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 0).isActive = true
        topview1.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 0).isActive = true
        topview1.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: 0).isActive = true
        topview1.heightAnchor.constraint(equalToConstant: 100).isActive = true
        
        welcome.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 120).isActive = true
        welcome.leadingAnchor.constraint(equalTo:containerView.leadingAnchor, constant: margin).isActive = true
        welcome.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -margin).isActive = true
        welcome.heightAnchor.constraint(equalTo: welcome.heightAnchor).isActive = true
        
        stackView.centerYAnchor.constraint(equalTo: containerView.centerYAnchor, constant: 0).isActive = true
        stackView.centerXAnchor.constraint(equalTo: containerView.centerXAnchor, constant: 0).isActive = true
        stackView.widthAnchor.constraint(equalToConstant: 360).isActive = true
        stackView.heightAnchor.constraint(equalToConstant: 280).isActive = true
        
        dangNhapText.topAnchor.constraint(equalTo: stackView.topAnchor, constant: 30).isActive = true
        dangNhapText.leadingAnchor.constraint(equalTo:stackView.leadingAnchor, constant: margin).isActive = true
        dangNhapText.trailingAnchor.constraint(equalTo: stackView.trailingAnchor, constant: -margin).isActive = true
        dangNhapText.heightAnchor.constraint(equalToConstant: 60).isActive = true
        
        matkhatText.topAnchor.constraint(equalTo: dangNhapText.bottomAnchor, constant: margin).isActive = true
        matkhatText.leadingAnchor.constraint(equalTo:stackView.leadingAnchor, constant: margin).isActive = true
        matkhatText.trailingAnchor.constraint(equalTo: stackView.trailingAnchor, constant: -margin).isActive = true
        matkhatText.heightAnchor.constraint(equalTo: dangNhapText.heightAnchor, constant: 0).isActive = true
        
        dangNhapbtnLogin.bottomAnchor.constraint(equalTo: stackView.bottomAnchor, constant: -30).isActive = true
        dangNhapbtnLogin.leadingAnchor.constraint(equalTo:dangNhapText.leadingAnchor, constant: 0).isActive = true
        dangNhapbtnLogin.trailingAnchor.constraint(equalTo: dangNhapText.trailingAnchor, constant: 0).isActive = true
        dangNhapbtnLogin.heightAnchor.constraint(equalTo: dangNhapText.heightAnchor, constant: 0).isActive = true
        
//        qmkButton.centerXAnchor.constraint(equalTo: containerView.centerXAnchor, constant: 0).isActive = true
//        qmkButton.widthAnchor.constraint(equalTo: qmkButton.widthAnchor, constant: 0).isActive = true
//        qmkButton.heightAnchor.constraint(equalTo: qmkButton.heightAnchor, constant: 0).isActive = true
//        qmkButton.bottomAnchor.constraint(equalTo: version.topAnchor, constant: -10).isActive = true
        
        bottomview.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: 0).isActive = true
        bottomview.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 0).isActive = true
        bottomview.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: 0).isActive = true
        bottomview.heightAnchor.constraint(equalToConstant: 100).isActive = true
        
        version.heightAnchor.constraint(equalTo: version.heightAnchor).isActive = true
        version.leadingAnchor.constraint(equalTo:containerView.leadingAnchor, constant: margin).isActive = true
        version.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -margin).isActive = true
        version.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -30).isActive = true
        
        
    }
    //MARK: --GET NOTIFI TU SV
    func getNotify(){
        ApiManager.shared.getNotify { [weak self] (_ data) in
            guard let strongSelf = self else {return}
            DispatchQueue.main.asyncAfter(deadline: .now() + 1){
                SVProgressHUD.dismiss()
            }
            strongSelf.getNotification = data
            strongSelf.is_seen.append((strongSelf.getNotification?.isSeen)!)
        } failure: { (code) in
            self.showAlert(alertText: "Lỗi....!!!!!", alertMessage: "Không lấy được thông tin")
        }
    }
// MARK: -- đăng nhập API
    @objc func btnLogin(){
        let dangnhap = self.dangNhapText.text! ; let matkhau = self.matkhatText.text!
        if dangnhap == "" && matkhau == ""{
            showAlert(alertText: "Lỗi????", alertMessage: "Vui Lòng Điền Tài Khoản")
        }
        print("da tap")
        Login(dangnhap, matkhau)
    }
    func Login(_ DangNhap: String,_ MatKhau: String){
        ApiManager.shared.loginAPP(DangNhap: DangNhap, MatKhau: MatKhau) { [weak self] in
            guard let strongSelf = self else {return}
            ApiManager.shared.getNotify { [weak self] (_ data) in
                guard let strongSelf = self else {return}
                strongSelf.getNotification = data
            } failure: { (code) in
                return
            }
            let tabBC = UITabBarController()
            let home = UINavigationController(rootViewController: Home())
            home.tabBarItem = UITabBarItem(title: "Trang Chủ", image: UIImage(systemName: "house.fill"), tag: 0)
            let homeprofile = UINavigationController(rootViewController: HomeProfileVC())
            homeprofile.tabBarItem = UITabBarItem(title: "Cài Đặt", image: UIImage(systemName: "gear"), tag: 1)
            tabBC.setViewControllers([home, homeprofile], animated: true)
            tabBC.modalPresentationStyle = .fullScreen
            tabBC.tabBar.barTintColor = .white
            strongSelf.present(tabBC, animated: true)
        } failure: { (msg) in
            self.showAlert(alertText: "--**Lỗi**--", alertMessage: "Lỗi Đăng Nhập. \n Vui Lòng Thử Lại!")
        }
    }

}
