//
//  HomeVC.swift
//  AppNotification
//
//  Created by namit on 03/12/2020.
//

import UIKit
import Alamofire
import SwiftyJSON
import Kingfisher

class HomeVC: UIViewController {
    var isFirst: Bool = true
    deinit {
        print("Huỷ HomeViewController")
    }

    let host = "https://id.mvpapp.vn/"
    var download = ""
 
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        let signout = UIBarButtonItem(image: UIImage.init(systemName: "multiply"), style: .done, target: self, action: #selector(signOut))
        navigationItem.leftBarButtonItem = signout
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.isTranslucent = true
        self.navigationController?.view.backgroundColor = .clear
//        let editMenu = UIBarButtonItem(image: UIImage.init(systemName: "line.horizontal.3.decrease"), style: .done, target: self, action: #selector(edit))
//        navigationItem.rightBarButtonItem = editMenu

        addSub();setLayout()
        DispatchQueue.main.async {
            self.checkSession()

            
        }

    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
    }
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()

    }
    @objc func edit(){
        let editVC = SlideMenuViewController()
        let navigationController = UINavigationController.init(rootViewController: editVC)
        navigationController.modalPresentationStyle = .fullScreen
        self.present(navigationController, animated: true, completion: nil)
    print("go edit")
    }
    @objc func signOut(){
        UserDefaults.standard.removeObject(forKey: "session_key")
        let loginVC = LoginVC()
        let window = UIApplication.shared.windows.first
        window?.rootViewController = loginVC
    print("log out")
    }
    func checkSession(){
        let checksession = "https://id.mvpapp.vn/api/v1/system/checkSession"
        let sessionKey = UserDefaults.standard.string(forKey: "session_key") ?? ""
        let par = ["session_key" : sessionKey]
        AF.request(checksession, method: .post, parameters: par, encoding: URLEncoding.default).responseJSON{ [weak self]
            response in
            guard let strongSelf = self else{return}
            switch response.result{
            case .success(let object):
                let json = JSON(object)
                if json["CODE"].stringValue == "SUCCESS"{
                    let data = AppNotification.checkSession(json: json["userData"])
                    
                    strongSelf.download = "\(strongSelf.host+(data?.avatar)!)"
                    DispatchQueue.main.async {
                        let titleview = UIView()
                        titleview.frame = CGRect(x: 0, y: 0, width: 320, height: 80)
                       
                        let avatar = UIImageView()
                        avatar.frame = CGRect(x: 275, y: 2, width: 40, height: 40)
                        avatar.clipsToBounds = true
                        avatar.contentMode = .scaleAspectFill
                        avatar.layer.cornerRadius = avatar.frame.height/2
                        avatar.kf.setImage(with: URL(string: strongSelf.download))
                        avatar.isUserInteractionEnabled = true
                        
                        let recognizer = UITapGestureRecognizer(target: self, action: #selector(HomeVC.edit))
                        avatar.addGestureRecognizer(recognizer)
                        let tilename = UILabel()
                        tilename.text = "\((data?.name)!) - \((data?.username)!)"
                        tilename.frame = CGRect(x: 0, y: 2, width: 270, height: 40)
                        tilename.textColor = UIColor(red:0.000, green:0.439, blue:0.973, alpha: 1.000)
                        tilename.font = UIFont.init(name: "Times New Roman", size: 20)
                        tilename.textAlignment = .center
                        titleview.addSubview(avatar)
                        titleview.addSubview(tilename)
                        strongSelf.navigationItem.titleView = titleview
                    }
                }
                if json["CODE"].stringValue == "SESSION_KEY_INVALID"{
                    DispatchQueue.main.async{
                        UserDefaults.standard.removeObject(forKey: "session_key")
                        let loginVC = LoginVC()
                        let window = UIApplication.shared.windows.first
                        window?.rootViewController = loginVC
                    }
                }
            case .failure(let err):
                print(err.localizedDescription)
            }
        }
    }
    func addSub(){
      
    }
    func setLayout(){
      
        
    }
 
}
