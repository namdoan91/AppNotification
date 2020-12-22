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
import FoldingCell
import SafariServices

class HomeVC: UITableViewController, WKNavigationDelegate, SFSafariViewControllerDelegate{
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
    enum Const {
        static let closeCellHeight: CGFloat = 179
        static let openCellHeight: CGFloat = 488
        static let rowsCount = 10
    }
    
    var cellHeights: [CGFloat] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "MVP APP"
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor(red:0.086, green:0.510, blue:0.973, alpha: 1.000),NSAttributedString.Key.font: UIFont(name: "Arial", size: 19)!]
        navigationItem.title = "MVP APP - NOTIFICATION"
        tableView.register(DemoCell.self, forCellReuseIdentifier: "DemoCell")
        tableView.separatorStyle = .singleLine
        DispatchQueue.main.async {
            self.checkSession()
            self.getNotify()
            self.loadinHubShow()
            self.setup()
        }
    }
    // MARK: Helpers
    private func setup() {
        cellHeights = Array(repeating: Const.closeCellHeight, count: Const.rowsCount)
        tableView.estimatedRowHeight = Const.closeCellHeight
        tableView.rowHeight = UITableView.automaticDimension
        tableView.backgroundColor = UIColor(patternImage: #imageLiteral(resourceName: "background"))
        if #available(iOS 10.0, *) {
            tableView.refreshControl = UIRefreshControl()
            tableView.refreshControl?.addTarget(self, action: #selector(refreshHandler), for: .valueChanged)
        }
    }
    @objc func refreshHandler() {
        let deadlineTime = DispatchTime.now() + .seconds(1)
        DispatchQueue.main.asyncAfter(deadline: deadlineTime, execute: { [weak self] in
            if #available(iOS 10.0, *) {
                self?.tableView.refreshControl?.endRefreshing()
            }
            self?.tableView.reloadData()
        })
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
    override func tableView(_: UITableView, numberOfRowsInSection _: Int) -> Int {
        return 10
    }

    override func tableView(_: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        guard case let cell as DemoCell = cell else {
            return
        }

        cell.backgroundColor = .clear

        if cellHeights[indexPath.row] == Const.closeCellHeight {
            cell.unfold(false, animated: false, completion: nil)
        } else {
            cell.unfold(true, animated: false, completion: nil)
        }

        cell.number = indexPath.row
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "FoldingCell", for: indexPath) as! FoldingCell
        let durations: [TimeInterval] = [0.26, 0.2, 0.2]
        cell.durationsForExpandedState = durations
        cell.durationsForCollapsedState = durations
        return cell
    }

    override func tableView(_: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return cellHeights[indexPath.row]
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

        let cell = tableView.cellForRow(at: indexPath) as! FoldingCell

        if cell.isAnimating() {
            return
        }

        var duration = 0.0
        let cellIsCollapsed = cellHeights[indexPath.row] == Const.closeCellHeight
        if cellIsCollapsed {
            cellHeights[indexPath.row] = Const.openCellHeight
            cell.unfold(true, animated: true, completion: nil)
            duration = 0.5
        } else {
            cellHeights[indexPath.row] = Const.closeCellHeight
            cell.unfold(false, animated: true, completion: nil)
            duration = 0.8
        }

        UIView.animate(withDuration: duration, delay: 0, options: .curveEaseOut, animations: { () -> Void in
            tableView.beginUpdates()
            tableView.endUpdates()
            
            // fix https://github.com/Ramotion/folding-cell/issues/169
            if cell.frame.maxY > tableView.frame.maxY {
                tableView.scrollToRow(at: indexPath, at: UITableView.ScrollPosition.bottom, animated: true)
            }
        }, completion: nil)
    }
    
//    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return id.count
//    }
//    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell = tableView.dequeueReusableCell(withIdentifier: "FoldingCell" , for: indexPath) as! FoldingCell
//        cell.titleNewLabel.text = content[indexPath.row]
//        cell.titleNewLabel.textColor = UIColor(red:0.086, green:0.510, blue:0.973, alpha: 1.000)
//        cell.contentLabel.text = sourceRound[indexPath.row]
//        cell.timerLabel.text = timer[indexPath.row]
//        return cell
//    }
//    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        let indexPath = tableView.indexPathForSelectedRow
//        let urls = linkUrl[indexPath!.row]
//        let safari = SFSafariViewController(url: URL(string: urls)!)
//        safari.delegate = self
//        self.present(safari, animated: true, completion : nil)
////        webview = WKWebView()
////        view = webview
////        webview.navigationDelegate = self
////        webview.load(URLRequest(url: URL(string: "\(urls)")!))
////        webview.allowsBackForwardNavigationGestures = true
//    }
//    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//        return UITableView.automaticDimension
//        //        return 100
//    }
//    override func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
//        cell.alpha = 0
//
//        UIView.animate(
//            withDuration: 0.2,
//            delay: 0.03 * Double(indexPath.row),
//            animations: {
//                cell.alpha = 1
//            })
//    }
}



