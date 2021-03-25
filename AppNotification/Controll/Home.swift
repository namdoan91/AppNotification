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
import EasyNotificationBadge

class Home: UIViewController, WKNavigationDelegate{
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
    var is_seen = [String]()
    var imageviewCell: UIImageView!
    var sourceRound = [String]()
    var timer = [String]()
    var code = [String]()
    let containerView: UIView = {
        let container = UIView()
        //        container.backgroundColor = UIColor.white
        container.translatesAutoresizingMaskIntoConstraints = false
        return container
    }()
    let labelTieuDe: UILabel = {
        let labeltieude = UILabel()
        labeltieude.translatesAutoresizingMaskIntoConstraints = false
        labeltieude.text = "Menu List"
        labeltieude.font = UIFont.init(name: "Arial", size: 20)
        labeltieude.textColor = .blue
        return labeltieude
    }()
    let buttonReload: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage.init(systemName: "goforward"), for: .normal)
        button.frame = CGRect(x: 0, y: 0, width: 20, height: 20)
        button.backgroundColor = .white
        button.layer.cornerRadius = button.frame.width/2
        return button
    }()
    let stackview: UIStackView = {
        let stackview = UIStackView()
        stackview.translatesAutoresizingMaskIntoConstraints = false
        stackview.layer.cornerRadius = 15
        //        stackview.clipsToBounds = true
        //        stackview.layer.masksToBounds = true
        return stackview
    }()
    let items = ["THÔNG TIN\nCHUNG", "ĐĂNG KÍ\nNGHỈ PHÉP", "ĐĂNG KÍ\nTĂNG CA", "ĐĂNG KÍ\nĐI TRỄ-VỀ SỚM"]
    var groupsTBC = [String]();var groupsNP = [String]();var groupsTC = [String]();var groupsDTVS = [String]()
    var issence = [Int]()
    let collectionview: UICollectionView = {
        //        let layCV = UICollectionViewFlowLayout()
        //        layCV.scrollDirection = .vertical
        //        layCV.estimatedItemSize = CGSize(width: 150 , height: 150)
        //        //chia khoảng cách trái phải
        //        layCV.minimumLineSpacing = 10
        //        // chia khoảng cách trên dưới
        //        layCV.minimumInteritemSpacing = 10
        //        let collectionview = UICollectionView(frame: .zero,collectionViewLayout: layCV)
        let collectionview = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout.init())
        collectionview.translatesAutoresizingMaskIntoConstraints = false
        //        collectionview.backgroundColor = UIColor.lightGray
        return collectionview
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white,NSAttributedString.Key.font: UIFont(name: "Arial", size: 24)!]
        navigationItem.title = "MVP APP"
        collectionview.dataSource = self
        collectionview.delegate = self
        collectionview.register(CollectionCell.self, forCellWithReuseIdentifier: "CollectionCell")
        colorBackround()
        addSub();setLayout()
        checkSession()
        getNotify()
        SVProgressHUD.show()
        SVProgressHUD.setForegroundColor(UIColor(red:0.518, green:0.604, blue:1.000, alpha: 1.000))
        SVProgressHUD.showSuccess(withStatus: "Loading Dữ Liệu Thành Công.!!!!")
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.minimumLineSpacing = 5
        layout.minimumInteritemSpacing = 5
        collectionview.setCollectionViewLayout(layout, animated: true)
    }
    
    //MARK: --REACTIVE VIEWDIDLOAD
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        checkSession()
        buttonReload.addTarget(self, action: #selector(tapReload), for: .touchUpInside)
    }
    func colorBackround(){
        let layer = CAGradientLayer()
        layer.colors = [UIColor(red: 0.21, green: 0.82, blue: 0.86, alpha: 1.00).cgColor,
                        UIColor(red: 0.36, green: 0.53, blue: 0.90, alpha: 1.00).cgColor]
        layer.frame = view.bounds
        layer.startPoint = CGPoint(x: 0, y: 1)
        layer.endPoint = CGPoint(x: 1, y: 1)
        view.layer.insertSublayer(layer, at: 0)
        collectionview.backgroundColor = .clear
    }
    //MARK: --RELOAD LẠI TRANG THÔNG TIN
    @objc func tapReload(){
        sourceRound.removeAll();id.removeAll();linkUrl.removeAll();is_seen.removeAll();content.removeAll();timer.removeAll();code.removeAll();groupsTBC.removeAll();groupsNP.removeAll();groupsTC.removeAll();groupsDTVS.removeAll()
        SVProgressHUD.show(withStatus: "Reloading data.......")
        SVProgressHUD.showSuccess(withStatus: "Reloading Dữ Liệu Thành Công.!!!!")
        getNotify()
    }
    func addSub(){
        view.addSubview(containerView)
        containerView.addSubview(labelTieuDe)
        containerView.addSubview(buttonReload)
        containerView.addSubview(stackview)
        stackview.addSubview(collectionview)
    }
    func setLayout(){
        containerView.topAnchor.constraint(equalTo: view.topAnchor, constant: 0).isActive = true
        containerView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0).isActive = true
        containerView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0).isActive = true
        containerView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0).isActive = true
        
        labelTieuDe.topAnchor.constraint(equalTo: containerView.layoutMarginsGuide.topAnchor, constant: 40).isActive = true
        labelTieuDe.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 20).isActive = true
        labelTieuDe.heightAnchor.constraint(equalToConstant: 20).isActive = true
        labelTieuDe.widthAnchor.constraint(equalToConstant: 150).isActive = true
        
        buttonReload.topAnchor.constraint(equalTo: containerView.layoutMarginsGuide.topAnchor, constant: 40).isActive = true
        buttonReload.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -40).isActive = true
        buttonReload.heightAnchor.constraint(equalToConstant: 20).isActive = true
        buttonReload.widthAnchor.constraint(equalToConstant: 20).isActive = true
        
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
    //MARK: KIỂM TRA LẠI SESSION XEM CÓ THÔNG TIN HAY KO?
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
    //MARK: -- LẤY THÔNG TIN LẠI TỪ SV
    func getNotify(){
        ApiManager.shared.getNotify { [weak self] (_ data) in
            guard let strongSelf = self else {return}
            DispatchQueue.main.asyncAfter(deadline: .now() + 1){
                SVProgressHUD.dismiss()
            }
            strongSelf.getNotification = data
            strongSelf.sourceRound.append((strongSelf.getNotification?.messege)!)
            strongSelf.content.append((strongSelf.getNotification?.title)!)
            strongSelf.is_seen.append((strongSelf.getNotification?.isSeen)!)
            if strongSelf.getNotification?.code == "TBC"{
                if strongSelf.getNotification?.isSeen == "N"{
                    strongSelf.groupsTBC.append((strongSelf.getNotification?.isSeen)!)
                }
            }
            if strongSelf.getNotification?.code == "DK_NP"{
                if strongSelf.getNotification?.isSeen == "N"{
                    strongSelf.groupsNP.append((strongSelf.getNotification?.isSeen)!)
                }
            }
            if strongSelf.getNotification?.code == "DK_TC"{
                if strongSelf.getNotification?.isSeen == "N"{
                    strongSelf.groupsTC.append((strongSelf.getNotification?.isSeen)!)
                }
            }
            if strongSelf.getNotification?.code == "DK_DTVS"{
                if strongSelf.getNotification?.isSeen == "N"{
                    strongSelf.groupsDTVS.append((strongSelf.getNotification?.isSeen)!)
                }
            }
            strongSelf.collectionview.reloadData()
        } failure: { (code) in
            self.showAlert(alertText: "Lỗi....!!!!!", alertMessage: "Không lấy được thông tin")
        }
    }
}
//MARK: --SHOW THÔNG TIN LÊN COLLECTIONVIEW
extension Home: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 1.0, left: 1.0, bottom: 1.0, right: 1.0)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let lay = collectionViewLayout as! UICollectionViewFlowLayout
        let widthPerItem = collectionview.frame.width / 2 - lay.minimumInteritemSpacing
        return CGSize(width: widthPerItem , height: 140)
    }
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return items.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionview.dequeueReusableCell(withReuseIdentifier: "CollectionCell", for: indexPath) as! CollectionCell
        cell.backgroundColor = UIColor.white
        cell.label.text = items[indexPath.row]
        cell.badge.textColor = .white
        cell.badge.preferredMaxLayoutWidth = 150
        var BadgeApp = BadgeAppearance()
        BadgeApp.allowShadow = true
        BadgeApp.backgroundColor = .red
        BadgeApp.textAlignment = .center
        BadgeApp.textColor = .white
        BadgeApp.distanceFromCenterX = 66
        BadgeApp.distanceFromCenterY = -58
        BadgeApp.borderWidth = 1
//        cell.container.badge(text: "Hello", appearance: BadgeApp)
        if indexPath.row == 0{
            cell.container.badge(text: "\(groupsTBC.count)", appearance: BadgeApp)
            cell.image.image = UIImage.init(systemName: "bell")
            cell.image.tintColor = UIColor(red:0.204, green:0.467, blue:0.965, alpha: 1.000)
        }else if indexPath.row == 1 {
            cell.container.badge(text: "\(groupsNP.count)", appearance: BadgeApp)
            cell.image.image = UIImage.init(systemName: "square.and.pencil")
            cell.image.tintColor = UIColor(red:0.204, green:0.467, blue:0.965, alpha: 1.000)
        }else if indexPath.row == 2{
            cell.container.badge(text: "\(groupsTC.count)", appearance: BadgeApp)
            cell.image.image = UIImage.init(systemName: "arrow.up.doc")
            cell.image.tintColor = UIColor(red:0.204, green:0.467, blue:0.965, alpha: 1.000)
        }else if indexPath.row == 3{
            cell.container.badge(text: "\(groupsDTVS.count)", appearance: BadgeApp)
            cell.image.image = UIImage.init(systemName: "doc.on.clipboard")
            cell.image.tintColor = UIColor(red:0.204, green:0.467, blue:0.965, alpha: 1.000)
        }
        cell.layer.cornerRadius = 10
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath){
        let homeTab = TabviewReport()
        homeTab.modalPresentationStyle = .fullScreen
        if indexPath.row == 0{
            homeTab.test = "TBC"
            navigationController?.pushViewController(homeTab, animated: true)
        } else if indexPath.row == 1{
            homeTab.test = "DK_NP"
            navigationController?.pushViewController(homeTab, animated: true)
        }
        else if indexPath.row == 2{
            homeTab.test = "DK_TC"
            navigationController?.pushViewController(homeTab, animated: true)
        }
        else if indexPath.row == 3{
            homeTab.test = "DK_DTVS"
            navigationController?.pushViewController(homeTab, animated: true)
        }
    }
}

