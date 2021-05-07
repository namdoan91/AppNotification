//
//  TabviewReport.swift
//  AppNotification
//
//  Created by namit on 11/03/2021.
//

import UIKit
import SwiftyJSON
import JXWebViewController
import ALWebViewController
import SafariServices
import Alamofire
import NotificationBannerSwift

class TabviewReport: UIViewController, UIGestureRecognizerDelegate,SFSafariViewControllerDelegate{
    
    deinit {
        print("Huỷ tableviewreport")
    }
    var group = [String](); var idPhieu = [Int]() ; var link = [String]() ; var timeCreate = [String]() ; var titleContent = [String](); var isseen = [String]()
    var jsonpresent: getNotify?
    var Unread = [String]()
    var test = String()
    let containerView: UIView = {
        let container = UIView()
//        container.backgroundColor = UIColor.white
        container.translatesAutoresizingMaskIntoConstraints = false
        container.layer.masksToBounds = true
        container.layer.cornerRadius = 10
        return container
    }()
    let info: UILabel = {
        let info = UILabel()
        info.translatesAutoresizingMaskIntoConstraints = false
        info.text = "Chi Tiết Thông Tin"
        info.font = UIFont.boldSystemFont(ofSize: 24)
        info.textColor = .white
        info.textAlignment = .center
        return info
    }()
    let Suminfo:UILabel = {
        let suminfo = UILabel()
        suminfo.translatesAutoresizingMaskIntoConstraints = false
        suminfo.text = "Chưa có thông tin"
        suminfo.textAlignment = .center
        return suminfo
    }()
    let TableView: UITableView = {
        let table = UITableView()
        table.translatesAutoresizingMaskIntoConstraints = false
        return table
    }()
    var checkSeSSion: checkSession!
    private let refreshControl = UIRefreshControl()
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController!.setNavigationBarHidden(true, animated: true)
        navigationController!.navigationBar.setBackgroundImage(UIImage(), for: .default)
        navigationController!.navigationBar.shadowImage = UIImage()
        navigationController?.navigationBar.isTranslucent = true
        navigationController?.navigationBar.backgroundColor = .clear
        let layer = CAGradientLayer()
        layer.colors = [UIColor(red: 0.21, green: 0.82, blue: 0.86, alpha: 1.00).cgColor,
                        UIColor(red: 0.36, green: 0.53, blue: 0.90, alpha: 1.00).cgColor]
        layer.frame = view.bounds
        layer.startPoint = CGPoint(x: 0, y: 1)
        layer.endPoint = CGPoint(x: 1, y: 1)
        view.layer.insertSublayer(layer, at: 0)
//        view.backgroundColor = UIColor(red: 207.0/255.0, green: 222.0/255.0, blue: 243.0/255.0, alpha: 1.0)
        addSub(); setLayout(); getNotify();checkAPI()
        TableView.register(TableViewCell.self, forCellReuseIdentifier: "TableViewCell")
        TableView.dataSource = self
        TableView.delegate = self
        TableView.separatorStyle = .none
        TableView.layer.cornerRadius = 15
//        navigationController?.interactivePopGestureRecognizer?.delegate = self
//        navigationController?.interactivePopGestureRecognizer?.isEnabled = false
        let uiPan = UIPanGestureRecognizer()
        uiPan.delegate = self
        view.addGestureRecognizer(UIPanGestureRecognizer(target: self, action: #selector(tapgestuzer)))
        if #available(iOS 10.0, *){
            self.TableView.refreshControl = refreshControl
        }else {
            self.TableView.addSubview(refreshControl)
        }
        refreshControl.addTarget(self, action: #selector(updateData), for: .valueChanged)
        refreshControl.tintColor = UIColor(red: 0.21, green: 0.82, blue: 0.86, alpha: 1.00)
        refreshControl.attributedTitle = NSAttributedString(string: "Cập nhật lại dữ liệu .....")
    }
    @objc func updateData(){
        self.group.removeAll();self.Unread.removeAll();self.idPhieu.removeAll();self.link.removeAll();self.titleContent.removeAll();self.timeCreate.removeAll();self.isseen.removeAll()
        self.getNotify();checkAPI()
        self.TableView.reloadData()
        self.refreshControl.endRefreshing()
    }
    @objc func tapgestuzer(){
        navigationController?.popToRootViewController(animated: true)
        navigationController?.setNavigationBarHidden(false, animated: true)
    }
//    func checkSession(){
//        ApiManager.shared.checkSession { [weak self] (_ data) in
//            guard let strongSelf = self else {return}
//            strongSelf.checkSeSSion = data
//        }failure: { (code) in
//            self.showAlert(alertText: "Lỗi....!!!!!", alertMessage: "Thông Tin Đăng Đã Được Thay Đổi.")
//        }
//    }
    func getNotify(){
        ApiManager.shared.getNotify { [weak self] (_ data) in
            guard let strongSelf = self else {return}
            strongSelf.jsonpresent = data
            if strongSelf.jsonpresent?.code == "TBC" && strongSelf.test == "TBC"{
                strongSelf.idPhieu.append((strongSelf.jsonpresent?.id)!)
                strongSelf.group.append((strongSelf.jsonpresent?.title)!)
                strongSelf.link.append((strongSelf.jsonpresent?.link)!)
                strongSelf.titleContent.append((strongSelf.jsonpresent?.messege)!)
                strongSelf.timeCreate.append((strongSelf.jsonpresent?.createdAtFormat)!)
                strongSelf.isseen.append((strongSelf.jsonpresent?.isSeen)!)
                if strongSelf.jsonpresent?.isSeen == "N"{
                    strongSelf.Unread.append((strongSelf.jsonpresent?.isSeen)!)
                }
            }
            if strongSelf.jsonpresent?.code == "DK_NP" && strongSelf.test == "DK_NP"{
                strongSelf.group.append((strongSelf.jsonpresent?.title)!)
                strongSelf.idPhieu.append((strongSelf.jsonpresent?.id)!)
                strongSelf.link.append((strongSelf.jsonpresent?.link)!)
                strongSelf.titleContent.append((strongSelf.jsonpresent?.messege)!)
                strongSelf.timeCreate.append((strongSelf.jsonpresent?.createdAtFormat)!)
                strongSelf.isseen.append((strongSelf.jsonpresent?.isSeen)!)
                if strongSelf.jsonpresent?.isSeen == "N"{
                    strongSelf.Unread.append((strongSelf.jsonpresent?.isSeen)!)
                }
            }
            if strongSelf.jsonpresent?.code == "DK_TC" && strongSelf.test == "DK_TC"{
                strongSelf.group.append((strongSelf.jsonpresent?.title)!)
                strongSelf.idPhieu.append((strongSelf.jsonpresent?.id)!)
                strongSelf.link.append((strongSelf.jsonpresent?.link)!)
                strongSelf.titleContent.append((strongSelf.jsonpresent?.messege)!)
                strongSelf.timeCreate.append((strongSelf.jsonpresent?.createdAtFormat)!)
                strongSelf.isseen.append((strongSelf.jsonpresent?.isSeen)!)
                if strongSelf.jsonpresent?.isSeen == "N"{
                    strongSelf.Unread.append((strongSelf.jsonpresent?.isSeen)!)
                }
            }
            if strongSelf.jsonpresent?.code == "DK_DTVS" && strongSelf.test == "DK_DTVS"{
                strongSelf.group.append((strongSelf.jsonpresent?.title)!)
                strongSelf.idPhieu.append((strongSelf.jsonpresent?.id)!)
                strongSelf.link.append((strongSelf.jsonpresent?.link)!)
                strongSelf.titleContent.append((strongSelf.jsonpresent?.messege)!)
                strongSelf.timeCreate.append((strongSelf.jsonpresent?.createdAtFormat)!)
                strongSelf.isseen.append((strongSelf.jsonpresent?.isSeen)!)
                if strongSelf.jsonpresent?.isSeen == "N"{
                    strongSelf.Unread.append((strongSelf.jsonpresent?.isSeen)!)
                }
            }
            strongSelf.TableView.reloadData()
            strongSelf.Suminfo.text = "Có \(strongSelf.group.count) thông báo, \(strongSelf.Unread.count) chưa đọc"
        } failure: { (code) in
        }
    }

    func addSub(){
        view.addSubview(containerView)
        containerView.addSubview(info)
        containerView.addSubview(Suminfo)
        containerView.addSubview(TableView)
    }
    func setLayout(){
        containerView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -20).isActive = true
        containerView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
        containerView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20).isActive = true
        containerView.topAnchor.constraint(equalTo: view.layoutMarginsGuide.topAnchor, constant: 20).isActive = true
        
        info.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 10).isActive = true
        info.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 40).isActive = true
        info.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -40).isActive = true
        info.heightAnchor.constraint(equalToConstant: 20).isActive = true
        
        Suminfo.topAnchor.constraint(equalTo: info.bottomAnchor, constant: 5).isActive = true
        Suminfo.trailingAnchor.constraint(equalTo: info.trailingAnchor, constant: 0).isActive = true
        Suminfo.heightAnchor.constraint(equalToConstant: 20).isActive = true
        Suminfo.leadingAnchor.constraint(equalTo: info.leadingAnchor, constant: 0).isActive = true
        
        TableView.topAnchor.constraint(equalTo: Suminfo.bottomAnchor, constant: 20).isActive = true
        TableView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 0).isActive = true
        TableView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: 0).isActive = true
        TableView.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -20).isActive = true
    }

}
extension TabviewReport: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return group.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TableViewCell", for: indexPath) as! TableViewCell
        cell.selectionStyle = .none
        cell.Circle.backgroundColor = .clear
        let pathCircle = CAShapeLayer()
        pathCircle.path = UIBezierPath(ovalIn: CGRect(x: 0, y: 0, width: 100, height: 100)).cgPath
        pathCircle.strokeColor = UIColor.blue.cgColor
        let layerGradient = CAGradientLayer()
        layerGradient.frame = CGRect(x: 0, y: 0, width: 100, height: 100)
        layerGradient.colors = [UIColor(red: 127.0/255.0, green: 127.0/255.0, blue: 213.0/255.0, alpha: 1.0).cgColor,UIColor(red: 134.0/255.0, green: 168.0/255.0, blue: 231.0/255.0, alpha: 1.0).cgColor,UIColor(red: 145.0/255.0, green: 234.0/255.0, blue: 228.0/255.0, alpha: 1.0).cgColor]
        layerGradient.startPoint = CGPoint(x: 0, y: 1)
        layerGradient.endPoint = CGPoint(x: 1, y: 1)
        layerGradient.mask = pathCircle
        cell.Circle.layer.addSublayer(layerGradient)
        cell.ID.tintColor = .white
        if test == "TBC"{
            cell.ID.image = UIImage.init(systemName: "bell")
        }
        if test == "DK_NP"{
            cell.ID.image = UIImage.init(systemName: "square.and.pencil")
        }
        if test == "DK_TC"{
            cell.ID.image = UIImage.init(systemName: "arrow.up.doc")
        }
        if test == "DK_DTVS"{
            cell.ID.image = UIImage.init(systemName: "doc.on.clipboard")
        }
        let infoColor = CAGradientLayer()
        infoColor.colors = [UIColor(red: 250.0/255.0, green: 255.0/255.0, blue: 209.0/255.0, alpha: 1.0).cgColor,UIColor(red: 161.0/255.0, green: 255.0/255.0, blue: 206.0/255.0, alpha: 1.0).cgColor]
        infoColor.frame = CGRect(x: 0, y: 0, width: (containerView.frame.width) - 10, height: 80)
        infoColor.startPoint = CGPoint(x: 0, y: 1)
        infoColor.endPoint = CGPoint(x: 1, y: 1)
        cell.idPhieu.text = "\(idPhieu[indexPath.row])"
        cell.infoView.layer.insertSublayer(infoColor, at: 0)
        cell.message.text = "\(titleContent[indexPath.row])"
        cell.createAt.text = timeCreate[indexPath.row]
        cell.title.text = "\(group[indexPath.row])"
        if isseen[indexPath.row] == "N"{
            cell.bagdeView.backgroundColor = .red
        }else if isseen[indexPath.row] == "Y"{
            cell.bagdeView.backgroundColor = .clear
        }
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//        return UITableView.automaticDimension
        return 110
    }
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        cell.alpha = 0
        UIView.animate(
            withDuration: 0.2,
            delay: 0.03 * Double(indexPath.row),
            animations: {
                cell.alpha = 1
            })
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let indexPath = tableView.indexPathForSelectedRow
        let urls = link[indexPath!.row]
        if urls.isValidURL{
            let safari = SFSafariViewController(url: URL(string: urls)!)
            safari.delegate = self
            let navi = UINavigationController(rootViewController: safari)
            navi.modalPresentationStyle = .fullScreen
            navi.setNavigationBarHidden(true, animated: true)
            self.present(navi, animated: true, completion: nil)
        }
//        print("urls : ------ \(urls)")
//        let urlType = ALWebContentType.url(url: URL(string: urls)!)
//        let webVC = ALWebViewController(content: urlType)
//        navigationController?.setToolbarHidden(true, animated: true)
//        navigationController?.pushViewController(webVC, animated: true)
    }
}
//extension TabviewReport: ALWebViewDelegate{
//    func webView(didStartLoading webVC: ALWebViewController) {
//        debugPrint("Start Loading")
//    }
//    func webView(didFinishLoading webVC: ALWebViewController) {
//        debugPrint("Finish Loading")
//    }
//}

extension String {
    var isValidURL: Bool {
        let detector = try! NSDataDetector(types: NSTextCheckingResult.CheckingType.link.rawValue)
        if let match = detector.firstMatch(in: self, options: [], range: NSRange(location: 0, length: self.utf16.count)) {
            // it is a link, if the match covers the whole string
            return match.range.length == self.utf16.count
        } else {
            let rightView = UIImageView(image: UIImage.init(systemName: "exclamationmark.triangle.fill"))
            rightView.tintColor = .white
            let banner = GrowingNotificationBanner(title: "Lỗi!!!!!!", subtitle: "Link Truy Cập Không Hợp Lệ!!!!!!!!", rightView: rightView, style: .danger)
            banner.show()
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5){
                banner.dismiss()
            }
            return false
        }
    }
    
}

