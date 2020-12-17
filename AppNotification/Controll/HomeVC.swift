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
import WebKit



class HomeVC: UITableViewController, WKNavigationDelegate{
    var isFirst: Bool = true
    deinit {
        print("Huỷ HomeViewController")
    }
    var dataname: String!
    var imageurl:String!
    var webview: WKWebView!
    var getNotification: getNotify?
    var checkSeSSion: checkSession!
    var content = [String]()
    var id = [Int]()
    var linkUrl = [String]()
    var is_seen = [Int]()
    var imageviewCell: UIImageView!
    var sourceRound = [String]()
    var timer = [String]()

 
    override func viewDidLoad() {
        super.viewDidLoad()
//        view.backgroundColor = .white
        title = "MVP APP"
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor(red:0.086, green:0.510, blue:0.973, alpha: 1.000),NSAttributedString.Key.font: UIFont(name: "Arial", size: 19)!]
        navigationItem.title = "MVP APP - NOTIFICATION"
        tableView.register(cell.self, forCellReuseIdentifier: "cell")
        tableView.separatorStyle = .singleLine
        DispatchQueue.main.async {
            self.checkSession()
            self.getNotify()
            self.loadinHubShow()
        }
        
    }
    override func viewDidAppear(_ animated: Bool) {

    }
    func loadinHubShow() {
        let alert = UIAlertController(title: nil, message: "Đang Tải Dữ Liệu ...!!!", preferredStyle: .alert)
        let loadingIndicator = UIActivityIndicatorView(frame: CGRect(x: 10, y: 5, width: 50, height: 50))
        loadingIndicator.color = .blue
        loadingIndicator.hidesWhenStopped = true
        loadingIndicator.style = UIActivityIndicatorView.Style.medium
        loadingIndicator.startAnimating();
        alert.view.addSubview(loadingIndicator)
        present(alert, animated: true, completion: nil)
    }

    func loadinHubDismiss() {
         dismiss(animated: false, completion: nil)
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
            strongSelf.loadinHubDismiss()
            strongSelf.getNotification = data
            strongSelf.sourceRound.append((strongSelf.getNotification?.content)!)
            strongSelf.id.append((strongSelf.getNotification?.id)!)
            strongSelf.linkUrl.append((strongSelf.getNotification?.link)!)
            strongSelf.is_seen.append((strongSelf.getNotification?.isSeen)!)
            strongSelf.content.append((strongSelf.getNotification?.title)!)
            strongSelf.timer.append((strongSelf.getNotification?.createdAt)!)
            strongSelf.tableView.reloadData()
        } failure: { (code) in
            self.showAlert(alertText: "Lỗi....!!!!!", alertMessage: "Không lấy được thông tin")

        }
    }
   
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return id.count
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell" , for: indexPath) as! cell
        cell.titleNewLabel.text = content[indexPath.row]
        cell.titleNewLabel.textColor = UIColor(red:0.086, green:0.510, blue:0.973, alpha: 1.000)
        cell.contentLabel.text = sourceRound[indexPath.row]
        cell.timerLabel.text = timer[indexPath.row]
//        cell.backgroundColor = UIColor.lightGray

//        if cell.titleNewLabel.text == "TĂNG CA"{
//            cell.avatarTitle.image = UIImage(named: "tangca")?.withTintColor(UIColor(red:0.220, green:0.643, blue:0.973, alpha: 1.000))
//        }
//        if cell.titleNewLabel.text == "ĐI TRỄ, VỀ SỚM"{
//            cell.avatarTitle.image = UIImage(named: "ditre")?.withTintColor(UIColor(red:0.220, green:0.643, blue:0.973, alpha: 1.000))
//        }
//        if cell.titleNewLabel.text == "THỰC ĐƠN"{
//            cell.avatarTitle.image = UIImage(named: "thucdon")?.withTintColor(UIColor(red:0.220, green:0.643, blue:0.973, alpha: 1.000))
//        }
//        if cell.titleNewLabel.text == "QUY ĐỊNH,THÔNG BÁO"{
//            cell.avatarTitle.image = UIImage(named: "quidinh")?.withTintColor(UIColor(red:0.220, green:0.643, blue:0.973, alpha: 1.000))
//        }
//        if cell.titleNewLabel.text == "LỊCH LÀM VIỆC"{
//            cell.avatarTitle.image = UIImage(named: "lich")?.withTintColor(UIColor(red:0.220, green:0.643, blue:0.973, alpha: 1.000))
//        }
//        if cell.titleNewLabel.text == "CHẤM CÔNG"{
//            cell.avatarTitle.image = UIImage(named: "fringer")?.withTintColor(UIColor(red:0.220, green:0.643, blue:0.973, alpha: 1.000))
//        }
//        if cell.titleNewLabel.text == "NGHỈ PHÉP"{
//            cell.avatarTitle.image = UIImage(named: "nghiphep")?.withTintColor(UIColor(red:0.220, green:0.643, blue:0.973, alpha: 1.000))
//        }
//        if cell.titleNewLabel.text == "BẢNG CÔNG"{
//            cell.avatarTitle.image = UIImage(named: "bangcong")?.withTintColor(UIColor(red:0.220, green:0.643, blue:0.973, alpha: 1.000))
//        }
//        if cell.titleNewLabel.text == "Y TẾ"{
//            cell.avatarTitle.image = UIImage(named: "yte")?.withTintColor(.red)
//        }
//        if cell.titleNewLabel.text == "TỈ LỆ THÔI VIỆC"{
//            cell.avatarTitle.image = UIImage(named: "thoiviec")?.withTintColor(.red)
//        }
//        if is_seen[indexPath.row] == 0 {
//            cell.containerView.backgroundColor = UIColor.blue.withAlphaComponent(0.6)
//        }
//        if is_seen[indexPath.row] == 1{
//            cell.containerView.backgroundColor = UIColor.red.withAlphaComponent(0.6)
//        }
//        if is_seen[indexPath.row] == 2{
//            cell.containerView.backgroundColor = UIColor.green.withAlphaComponent(0.6)
//        }
        
        return cell
    }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let indexPath = tableView.indexPathForSelectedRow
        let urls = linkUrl[indexPath!.row]
        webview = WKWebView()
        view = webview
        webview.navigationDelegate = self
        webview.load(URLRequest(url: URL(string: "\(urls)")!))
    }
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
//        return 100
    }
    override func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        cell.alpha = 0

        UIView.animate(
            withDuration: 0.2,
            delay: 0.03 * Double(indexPath.row),
            animations: {
                cell.alpha = 1
        })
    }
    
}



