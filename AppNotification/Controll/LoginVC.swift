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

class LoginVC: UIViewController {
    let containerView: UIView = {
        let container = UIView()
        container.backgroundColor = UIColor.white
        container.translatesAutoresizingMaskIntoConstraints = false
        return container
    }()
    let welcome: UILabel = {
        let welcome = UILabel()
        welcome.translatesAutoresizingMaskIntoConstraints = false
        welcome.text = "WELCOME BACK APP NOTIFICATION"
        welcome.textAlignment = .center
        welcome.textColor = UIColor(red:0.518, green:0.604, blue:1.000, alpha: 1.000)
        welcome.font = UIFont.init(name: "Times New Roman", size: 34)
        welcome.numberOfLines = 0
        return welcome
    }()
    let dangNhapText: TextFieldEffects = {
        let dangnhap = KaedeTextField()
        dangnhap.translatesAutoresizingMaskIntoConstraints = false
        dangnhap.setIcon(UIImage(named: "use")!)
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
        dangnhap.setIcon(UIImage(named: "password")!)
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
        dangnhap.titleLabel?.font = UIFont.init(name: "Times New Roman", size: 24)
        dangnhap.layer.cornerRadius = 30
        dangnhap.clipsToBounds = true
        return dangnhap
    } ()
    let qmkButton: UIButton = {
        let dangnhap = UIButton()
        dangnhap.translatesAutoresizingMaskIntoConstraints = false
//        dangnhap.backgroundColor = UIColor(red:0.980, green:0.980, blue:0.980, alpha: 1.000)
        dangnhap.setTitle("Quên mật khẩu !", for: .normal)
        dangnhap.setTitleColor(UIColor(red:0.518, green:0.604, blue:1.000, alpha: 1.000), for: .normal)
        dangnhap.titleLabel?.font = UIFont.init(name: "Times New Roman", size: 17)
        return dangnhap
    } ()
    let version: UILabel = {
        let welcome = UILabel()
        welcome.translatesAutoresizingMaskIntoConstraints = false
        welcome.text = "Ver 1.0.0"
        welcome.textAlignment = .center
        welcome.textColor = UIColor(red:0.518, green:0.604, blue:1.000, alpha: 1.000)
        welcome.font = UIFont.init(name: "Times New Roman", size: 17)
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
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor?.color(UIColor())
        addSubView(); setLayout(); layer(); addTap()
        
    }
    func addTap(){
        dangNhapbtnLogin.addTarget(self, action: #selector(btnLogin), for: .touchUpInside)
    }
    func layer(){
        containerView.layer.masksToBounds = false
        containerView.layer.shadowOffset = CGSize(width: 10, height: 10)
        containerView.layer.shadowOpacity = 10
        containerView.layer.shadowRadius = 10
        containerView.layer.shadowColor = UIColor.lightGray.cgColor
        
        stackView.layer.masksToBounds = false
        stackView.layer.shadowOffset = CGSize(width: 10, height: 10)
        stackView.layer.shadowOpacity = 10
        stackView.layer.shadowRadius = 10
        stackView.layer.shadowColor = UIColor.lightGray.cgColor
    }
    func addSubView(){
        view.addSubview(containerView)
        containerView.addSubview(stackView)
        stackView.addSubview(dangNhapText)
        stackView.addSubview(matkhatText)
        stackView.addSubview(dangNhapbtnLogin)
        containerView.addSubview(welcome)
        containerView.addSubview(qmkButton)
        containerView.addSubview(version)
    }
    func setLayout(){
        containerView.topAnchor.constraint(equalTo: view.topAnchor, constant: 0).isActive = true
        containerView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0).isActive = true
        containerView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0).isActive = true
        containerView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0).isActive = true
        
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
        
        qmkButton.centerXAnchor.constraint(equalTo: containerView.centerXAnchor, constant: 0).isActive = true
        qmkButton.widthAnchor.constraint(equalTo: qmkButton.widthAnchor, constant: 0).isActive = true
        qmkButton.heightAnchor.constraint(equalTo: qmkButton.heightAnchor, constant: 0).isActive = true
        qmkButton.bottomAnchor.constraint(equalTo: version.topAnchor, constant: -10).isActive = true
        
        version.heightAnchor.constraint(equalTo: version.heightAnchor).isActive = true
        version.leadingAnchor.constraint(equalTo:containerView.leadingAnchor, constant: margin).isActive = true
        version.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -margin).isActive = true
        version.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -30).isActive = true
        
        
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
       let apiURL = "https://id.mvpapp.vn/api/v1/system/Login"
        let para = ["username" : DangNhap, "password": MatKhau]
        AF.request(apiURL, method: .post, parameters: para, encoding: URLEncoding.default).responseJSON{
            response in
            switch response.result{
            case .success(let value):
                let json = JSON(value)
                print(json)
               
                if json["CODE"].stringValue == "SESSION_KEY_INVALID"{
                    self.showAlert(alertText: "Lỗi????", alertMessage: "Mật Khẫu Không Đúng Hoặc Đã Bị Thay Đổi")
                }
                if json["CODE"].stringValue == "SUCCESS" && !json["session_key"].stringValue.isEmpty{
                    let sessionKey = json["session_key"].stringValue
                        UserDefaults.standard.setValue(sessionKey, forKey: "session_key")
                        let homeVC = HomeVC()
                        let navigationController = UINavigationController.init(rootViewController: homeVC)
                        navigationController.modalPresentationStyle = .fullScreen
                        self.present(navigationController, animated: true)
                    print(sessionKey)
                }
                if json["CODE"].stringValue == "LOGIN_FAILED"{
                    self.showAlert(alertText: "--**Lỗi**--", alertMessage: "Mật Khẩu Không Đúng")
                }
            case .failure(let err):
                print(err.localizedDescription)
            }
        }
    }

}
