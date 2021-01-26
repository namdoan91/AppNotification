//
//  Home.swift
//  AppNotification
//
//  Created by namit on 15/01/2021.
//

import UIKit
import Alamofire
import Kingfisher
import WebKit
import JXWebViewController
import SwiftyJSON
import SVProgressHUD

class Home: UIViewController, WKNavigationDelegate {
    deinit {
        print("Huỷ HomeViewController")
    }
    
    var dataname: String!
    var imageurl:String!
    var getNotification: getNotify?
    var checkSeSSion: checkSession!
    var content = [String]()
    var id = [Int]()
    var linkUrl = [String]()
    var is_seen = [Int]()
    var imageviewCell: UIImageView!
    var sourceRound = [String]()
    var timer = [String]()
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
    let labelTieuDe: UILabel = {
        let labeltieude = UILabel()
        labeltieude.translatesAutoresizingMaskIntoConstraints = false
        labeltieude.text = "Menu List"
        labeltieude.font = UIFont.init(name: "Arial", size: 20)
        labeltieude.textColor = .blue
        return labeltieude
    }()
    let stackview: UIStackView = {
        let stackview = UIStackView()
        stackview.translatesAutoresizingMaskIntoConstraints = false
        stackview.backgroundColor = .clear
        stackview.layer.cornerRadius = 15
//        stackview.clipsToBounds = true
//        stackview.layer.masksToBounds = true
        return stackview
    }()
    let items = ["Nghỉ Phép", "Đi trễ \n Về Sớm", "Tăng Ca", "Thực Đơn", "Chấm Công","Lịch Làm \n Việc", "Y Tế", "Quy Định \n Thông Báo", "Tỉ Lệ \n Thôi Việc"]
    
    let collectionview: UICollectionView = {
        let layCV = UICollectionViewFlowLayout()
        layCV.scrollDirection = .vertical
        layCV.estimatedItemSize = CGSize(width: 140, height: 100)
        //chia khoảng cách trái phải
        layCV.minimumLineSpacing = 15
        // chia khoảng cách trên dưới
        layCV.minimumInteritemSpacing = 15
        let collectionview = UICollectionView(frame: .zero,collectionViewLayout: layCV)
        collectionview.translatesAutoresizingMaskIntoConstraints = false
        collectionview.backgroundColor = UIColor.lightGray.withAlphaComponent(1.3)
        return collectionview
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white,NSAttributedString.Key.font: UIFont(name: "Arial", size: 24)!]
        navigationItem.title = "MVP APP - NOTIFICATION"
        view.backgroundColor = .clear
        containerView.backgroundColor = UIColor.lightGray
        collectionview.dataSource = self
        collectionview.delegate = self
        collectionview.register(CollectionCell.self, forCellWithReuseIdentifier: "CollectionCell")
        addSub();setLayout()
        checkSession()
        getNotify()
        SVProgressHUD.dismiss()
    }
    
    func addSub(){
        view.addSubview(containerView)
        containerView.addSubview(topview1)
        containerView.addSubview(topview)
        containerView.addSubview(labelTieuDe)
        containerView.addSubview(stackview)
        stackview.addSubview(collectionview)

    }
    func setLayout(){
        containerView.topAnchor.constraint(equalTo: view.topAnchor, constant: 0).isActive = true
        containerView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0).isActive = true
        containerView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0).isActive = true
        containerView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0).isActive = true
        
        topview.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 0).isActive = true
        topview.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 0).isActive = true
        topview.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: 0).isActive = true
        topview.heightAnchor.constraint(equalToConstant: 160).isActive = true
        
        topview1.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 0).isActive = true
        topview1.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 0).isActive = true
        topview1.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: 0).isActive = true
        topview1.heightAnchor.constraint(equalToConstant: 180).isActive = true
        
        labelTieuDe.topAnchor.constraint(equalTo: topview1.bottomAnchor, constant: 30).isActive = true
        labelTieuDe.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 20).isActive = true
        labelTieuDe.heightAnchor.constraint(equalToConstant: 20).isActive = true
        labelTieuDe.widthAnchor.constraint(equalToConstant: 150).isActive = true
        
        stackview.topAnchor.constraint(equalTo: labelTieuDe.bottomAnchor, constant: 0).isActive = true
        stackview.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 10).isActive = true
        stackview.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -10).isActive = true
        stackview.bottomAnchor.constraint(equalTo: view.layoutMarginsGuide.bottomAnchor, constant: -20).isActive = true
        
        collectionview.topAnchor.constraint(equalTo: stackview.topAnchor, constant: 20).isActive = true
        collectionview.leadingAnchor.constraint(equalTo: stackview.leadingAnchor, constant: 10).isActive = true
        collectionview.trailingAnchor.constraint(equalTo: stackview.trailingAnchor, constant: -10).isActive = true
        collectionview.heightAnchor.constraint(equalToConstant: stackview.frame.height/2).isActive = true
        collectionview.bottomAnchor.constraint(equalTo: stackview.bottomAnchor, constant: -20).isActive = true
        
       
    }
    func checkSession(){
        ApiManager.shared.checkSession { [weak self] (_ data) in
            guard let strongSelf = self else {return}
            strongSelf.checkSeSSion = data
            strongSelf.imageurl = APINameManager.shared.avatar + strongSelf.checkSeSSion.avatar!
            let rightMenu = ImageBarButton(withUrl: URL(string: "\(strongSelf.imageurl!)"))
            strongSelf.navigationItem.rightBarButtonItem = rightMenu.load()
        }failure: { (code) in
            self.showAlert(alertText: "Lỗi....!!!!!", alertMessage: "Thông Tin Đăng Đã Được Thay Đổi.")
        }
    }
    func getNotify(){
        ApiManager.shared.getNotify { [weak self] (_ data) in
            guard let strongSelf = self else {return}
            DispatchQueue.main.asyncAfter(deadline: .now()){
            }
            strongSelf.getNotification = data
            strongSelf.sourceRound.append((strongSelf.getNotification?.content)!)
            strongSelf.id.append((strongSelf.getNotification?.id)!)
            strongSelf.linkUrl.append((strongSelf.getNotification?.link)!)
            strongSelf.is_seen.append((strongSelf.getNotification?.isSeen)!)
            strongSelf.content.append((strongSelf.getNotification?.title)!)
            strongSelf.timer.append((strongSelf.getNotification?.createdAt)!)
//            strongSelf.tableView.reloadData()
        } failure: { (code) in
            self.showAlert(alertText: "Lỗi....!!!!!", alertMessage: "Không lấy được thông tin")
        }
    }

}
extension Home: UICollectionViewDataSource, UICollectionViewDelegate{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: (collectionview.frame.width/3) - 16 , height: (collectionview.frame.width/2) - 45)
    }
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return items.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionview.dequeueReusableCell(withReuseIdentifier: "CollectionCell", for: indexPath) as! CollectionCell
        cell.backgroundColor = .white
        cell.label.text = items[indexPath.row]
//        cell.container.layer.cornerRadius = 10
        cell.layer.cornerRadius = 10
//        cell.layer.masksToBounds = true
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print(items[indexPath.row])
        
    }
}
