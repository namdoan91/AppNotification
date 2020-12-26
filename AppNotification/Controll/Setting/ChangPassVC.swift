//
//  ChangPassVC.swift
//  AppNotification
//
//  Created by namit on 07/12/2020.
//

import UIKit
import SkyFloatingLabelTextField
import Alamofire
import SwiftUI

class ChangPassVC: UIViewController {
    deinit {
        print("Huỷ ChangePass Controller")
    }
    let container:UIView = {
        let container = UIView()
        container.translatesAutoresizingMaskIntoConstraints = false
        container.backgroundColor = UIColor(red:0.906, green:0.918, blue:0.929, alpha: 1.000)
        container.clipsToBounds = true
        return container
    }()
    let stackview: UIStackView = {
        let stackview = UIStackView()
        stackview.translatesAutoresizingMaskIntoConstraints = false
        stackview.backgroundColor = .white
        stackview.clipsToBounds = true
        return stackview
    }()
    let titleLabel: UILabel = {
        let titlelabel = UILabel()
        titlelabel.translatesAutoresizingMaskIntoConstraints = false
        titlelabel.text = "Mật khẩu phải bao gồm chữ và số, không được chứa năm sinh, số điện thoại"
        titlelabel.textAlignment = .center
        titlelabel.numberOfLines = 0
        return titlelabel
    }()
    let oldPass: UILabel = {
        let dangnhap = UILabel()
        dangnhap.translatesAutoresizingMaskIntoConstraints = false
        dangnhap.text = "Mật khẩu hiện tại:"
        dangnhap.font = UIFont.italicSystemFont(ofSize: 17)
        dangnhap.clipsToBounds = true
        return dangnhap
    }()
    let newPass: UILabel = {
        let dangnhap = UILabel()
        dangnhap.translatesAutoresizingMaskIntoConstraints = false
        dangnhap.text = "Mật khẩu mới:"
        dangnhap.font = UIFont.italicSystemFont(ofSize: 17)
        dangnhap.clipsToBounds = true
        return dangnhap
    }()
    var titleOldPass: UITextField = {
        let titelname = UITextField()
        titelname.translatesAutoresizingMaskIntoConstraints = false
        titelname.clipsToBounds = true
        titelname.isSecureTextEntry = true
        titelname.clearsOnBeginEditing = true
        titelname.placeholder = "Nhập mật khẩu hiện tại"
        return titelname
    }()
    var titleNewPass: UITextField = {
        let titelname = UITextField()
        titelname.translatesAutoresizingMaskIntoConstraints = false
        titelname.clipsToBounds = true
        titelname.isSecureTextEntry = true
        titelname.clearsOnBeginEditing = true
        titelname.placeholder = "Nhập mật khẩu mới"
        return titelname
    }()
    var titleReNewPass: UITextField = {
        let titelname = UITextField()
        titelname.translatesAutoresizingMaskIntoConstraints = false
        titelname.clipsToBounds = true
        titelname.isSecureTextEntry = true
        titelname.clearsOnBeginEditing = true
        titelname.placeholder = "Nhập lại mật khẩu"
        return titelname
    }()
    let changePasword: UIButton = {
        let register = UIButton()
        register.translatesAutoresizingMaskIntoConstraints = false
        register.setTitle("Cập Nhật", for: .normal)
        register.backgroundColor = UIColor(red:0.733, green:0.733, blue:0.733, alpha: 1.000)
        register.layer.cornerRadius = 15
        register.titleLabel?.font = UIFont.init(name: "Arial", size: 15)
        register.isUserInteractionEnabled = false
        return register
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
//        navigationController!.navigationBar.setBackgroundImage(UIImage(), for: .default)
//        navigationController!.navigationBar.shadowImage = UIImage()
//        navigationController?.navigationBar.isTranslucent = true
        navigationItem.title = "Cập Nhật Mật Khẩu"
       
//        let bottomeLine = CALayer()
//        bottomeLine.frame = CGRect(x: 0, y: titleOldPass.frame.height - 2, width: titleOldPass.frame.width, height: 2)
//        bottomeLine.backgroundColor = UIColor.init(red: 48/255, green: 173/255, blue: 99/255, alpha: 1).cgColor
//        titleOldPass.borderStyle = .none
//        titleOldPass.layer.addSublayer(bottomeLine)
        changePasword.addTarget(self, action: #selector(killchangePass), for: .touchUpInside)
        addSub();setLayout()
        print("test viewdidload")
        DispatchQueue.main.async {
//            self.container.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(self.animationOut)))
          
        }
      
    }
    override func viewDidLayoutSubviews(){
        super.viewWillLayoutSubviews()
        let bottomeLine = CALayer()
        bottomeLine.frame = CGRect(x: 0, y: titleOldPass.frame.height - 2, width: titleOldPass.frame.width, height: 2)
        bottomeLine.backgroundColor = UIColor.init(red: 48/255, green: 173/255, blue: 99/255, alpha: 1).cgColor
        titleOldPass.borderStyle = .none
        titleOldPass.layer.addSublayer(bottomeLine)
        let bottomeLine1 = CALayer()
        bottomeLine1.frame = CGRect(x: 0, y: titleNewPass.frame.height - 2, width: titleNewPass.frame.width, height: 2)
        bottomeLine1.backgroundColor = UIColor.init(red: 48/255, green: 173/255, blue: 99/255, alpha: 1).cgColor
        titleNewPass.borderStyle = .none
        titleNewPass.layer.addSublayer(bottomeLine1)
        let bottomeLine2 = CALayer()
        bottomeLine2.frame = CGRect(x: 0, y: titleReNewPass.frame.height - 2, width: titleReNewPass.frame.width, height: 2)
        bottomeLine2.backgroundColor = UIColor.init(red: 48/255, green: 173/255, blue: 99/255, alpha: 1).cgColor
        titleReNewPass.borderStyle = .none
        titleReNewPass.layer.addSublayer(bottomeLine2)
        print("test viewDidLayoutSubviews")
    }
    func addSub(){
        view.addSubview(container)
        container.addSubview(stackview)
        container.addSubview(titleLabel)
        stackview.addSubview(oldPass)
        stackview.addSubview(newPass)
        stackview.addSubview(titleOldPass)
        stackview.addSubview(titleNewPass)
        stackview.addSubview(titleReNewPass)
        stackview.addSubview(changePasword)

    }
    func setLayout(){
        container.topAnchor.constraint(equalTo: view.topAnchor, constant: 0).isActive = true
        container.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0).isActive = true
        container.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0).isActive = true
        container.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0).isActive = true
        
        titleLabel.topAnchor.constraint(equalTo: container.topAnchor, constant: 0).isActive = true
        titleLabel.leadingAnchor.constraint(equalTo: container.leadingAnchor, constant: 20).isActive = true
        titleLabel.trailingAnchor.constraint(equalTo: container.trailingAnchor, constant: -20).isActive = true
        titleLabel.heightAnchor.constraint(equalToConstant: 60).isActive = true
        
        stackview.topAnchor.constraint(equalTo: view.layoutMarginsGuide.topAnchor, constant: 60).isActive = true
        stackview.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0).isActive = true
        stackview.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0).isActive = true
        stackview.bottomAnchor.constraint(equalTo: view.layoutMarginsGuide.bottomAnchor, constant: 0).isActive = true
        
        oldPass.topAnchor.constraint(equalTo: stackview.topAnchor, constant:  20).isActive = true
        oldPass.leadingAnchor.constraint(equalTo: stackview.leadingAnchor, constant: 20).isActive = true
        oldPass.trailingAnchor.constraint(equalTo: stackview.trailingAnchor, constant: -20).isActive = true
        
        titleOldPass.topAnchor.constraint(equalTo: oldPass.bottomAnchor, constant: 10).isActive = true
        titleOldPass.leadingAnchor.constraint(equalTo: stackview.leadingAnchor, constant: 20).isActive = true
        titleOldPass.trailingAnchor.constraint(equalTo: stackview.trailingAnchor, constant: -20).isActive = true
        titleOldPass.heightAnchor.constraint(equalToConstant: 30).isActive = true
        
        newPass.topAnchor.constraint(equalTo: titleOldPass.bottomAnchor, constant: 10).isActive = true
        newPass.leadingAnchor.constraint(equalTo: stackview.leadingAnchor, constant: 20).isActive = true
        newPass.trailingAnchor.constraint(equalTo: stackview.trailingAnchor, constant: -20).isActive = true
        
        titleNewPass.topAnchor.constraint(equalTo: newPass.bottomAnchor, constant:  10).isActive = true
        titleNewPass.leadingAnchor.constraint(equalTo: stackview.leadingAnchor, constant: 20).isActive = true
        titleNewPass.trailingAnchor.constraint(equalTo: stackview.trailingAnchor, constant: -20).isActive = true
        titleNewPass.heightAnchor.constraint(equalToConstant: 30).isActive = true
        
        titleReNewPass.topAnchor.constraint(equalTo: titleNewPass.bottomAnchor, constant: 10).isActive = true
        titleReNewPass.leadingAnchor.constraint(equalTo: stackview.leadingAnchor, constant: 20).isActive = true
        titleReNewPass.trailingAnchor.constraint(equalTo: stackview.trailingAnchor, constant: -20).isActive = true
        titleReNewPass.heightAnchor.constraint(equalToConstant: 30).isActive = true
        
        changePasword.topAnchor.constraint(equalTo: titleReNewPass.bottomAnchor, constant: 40).isActive = true
        changePasword.leadingAnchor.constraint(equalTo: stackview.leadingAnchor, constant: 20).isActive = true
        changePasword.trailingAnchor.constraint(equalTo: stackview.trailingAnchor, constant: -20).isActive = true
        changePasword.heightAnchor.constraint(equalToConstant: 40).isActive = true
        
    }
//    @objc func animationOut(){
//        UIView.animate(withDuration: 0.3){
//            self.container.transform = CGAffineTransform(translationX: 0, y: -self.view.frame.height)
//            self.navigationController?.popToRootViewController(animated: true)
//        }
//    }
    @objc func killchangePass(){
        let TitleOldPass = titleOldPass.text!
        let TitleNewPass = titleNewPass.text!
        let TitleReNewPass = titleReNewPass.text!
        if titleOldPass.text! == ""{
            let alert = UIAlertController(title: "Thông Báo", message: "Vui Lòng Điền Mật Khẩu Cũ", preferredStyle: UIAlertController.Style.alert)
            alert.addAction(UIAlertAction(title: "Quay Lại", style: UIAlertAction.Style.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
        if titleNewPass.text! == ""{
            let alert = UIAlertController(title: "Thông Báo", message: "Vui Lòng Điền Mật Khẩu Mới", preferredStyle: UIAlertController.Style.alert)
            alert.addAction(UIAlertAction(title: "Quay Lại", style: UIAlertAction.Style.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
        if titleReNewPass.text! == ""{
            let alert = UIAlertController(title: "Thông Báo", message: "Vui Lòng Nhập Lại Mật Khẩu Mới", preferredStyle: UIAlertController.Style.alert)
            alert.addAction(UIAlertAction(title: "Quay Lại", style: UIAlertAction.Style.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
        if TitleNewPass != TitleReNewPass{
            let alert = UIAlertController(title: "Thông Báo", message: "Mật Khẩu Mới Không Giống Nhau", preferredStyle: UIAlertController.Style.alert)
            alert.addAction(UIAlertAction(title: "Quay Lại", style: UIAlertAction.Style.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
        thayDoiPass(TitleOldPass, TitleNewPass)
        print("da nhan thay doi mk")
    }
//    MARK: -- skill thay đổi mật khẩu
    func thayDoiPass(_ titleOldPass: String,_ titleNewPass: String){
        ApiManager.shared.changPass(password_OLD: titleOldPass, password_NEW: titleNewPass){[weak self] in
            guard let strongSelf = self else {return}
            let alert = UIAlertController(title: "SUCCESS", message: "Cập Nhật Mật Khẩu Thành Công", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Ok!!!", style: .default,
            handler:{ (UIAlertAction) in
                strongSelf.navigationController?.popToRootViewController(animated: true)
            }))
            strongSelf.present(alert, animated: true)
            }failure: { (String) in
            self.showAlert(alertText: "Lỗi....!!!!!", alertMessage: "Mật Khẩu Cũ Không Đúng")
        }
    }

}
