//
//  TermsVC.swift
//  AppNotification
//
//  Created by namit on 21/12/2020.
//

import UIKit

class TermsVC: UIViewController {
    let contaiverView: UIView = {
        let container = UIView()
        container.translatesAutoresizingMaskIntoConstraints = false
        container.backgroundColor = UIColor(red: 0.867, green: 0.867, blue: 0.867, alpha: 1)
        return container
    }()
    let ScrollView : UIScrollView = {
        let stackview = UIScrollView()
        stackview.translatesAutoresizingMaskIntoConstraints = false
        stackview.backgroundColor = .white
        stackview.layer.cornerRadius = 10
//        stackview.isUserInteractionEnabled = true
        return stackview
    }()

    let contentView : UIView = {
        let contentview = UIView()
        contentview.translatesAutoresizingMaskIntoConstraints = false
//        contentview.backgroundColor = .green
        return contentview
    }()
    let textTieuDe: UILabel = {
        let text = UILabel()
        text.translatesAutoresizingMaskIntoConstraints = false
        text.text = "Điều Khoản Sử Dụng"
        text.font = UIFont.init(name: "TimesNewRomanPSMT", size: 21)
        text.textAlignment = .center
        text.textColor = .red
        return text
    }()
    
    let textContent: UILabel = {
        let text = UILabel()
        text.translatesAutoresizingMaskIntoConstraints = false
        text.text = "\n Vui lòng đọc kỹ Thoả Thuận Sử Dụng trước khi bạn tiến hành tải, cài đặt, sử dụng tất cả hoặc bất kỳ phần nào của ứng dụng MVP APP - NOTIFICATION. Trường hợp bạn không đồng ý với bất kỳ điều khoản nào của chúng tôi, bạn vui lòng không tải, cài đặt, sử dụng Ứng dụng hoặc tháo gỡ Ứng dụng ra khỏi thiết bị di động của bạn \n \n 1. Cập Nhật: \n Thoả Thuận này có thể được cập nhật thường xuyên với Group IT MVP, phiên bản sẽ được công bố tại https://mvppapp.vn. Phiên bản cập nhật sẽ thay thế cho các quy định và điều kiện trong thoả thuận ban đầu. Bạn có thể truy cập Ứng dụng hoặc vào website trên đây để xem nội dung chi tiết của phiên bản cập nhật \n \n 2. Giới Thiệu Về Ứng Dụng. \n MVP APP - NOTIFICATION là ứng dụng nhận thông báo riêng dành cho người dùng di động tại MVP. Ứng dụng được cung cấp tài khoản riêng cho cá nhân từng nhân viên. Tương tác trực tiếp với website trên đây. \n \n 3. Quyền Sở Hữu Ứng Dụng. \n Ứng Dụng này được phát triển và sở hữu hởi Group IT MVP, tất cả các quyền sở hữ trí tuệ liên quan đến Ứng Dụng( bao gồm nhưng không giới hạn mã nguồn, hình ảnh, dữ liệu, thông tin, nội dung chứa đựng trong Ứng Dụng; các sửa đổi, bổ sung, cập nhật Ứng Dụng) và các tài liệu hướng dẫn liên quan(nếu có) sẽ thuộc quyền sở hữu duy nhất bởi Group IT MVP và không cá nhân, tổ chức nào được phép sao chép, tái tạo, phân phối, hoặc hình thức khác xâm phạm tới quyền của chủ sở hữu nếu không có sự đồng ý và cho phép bằng văn bản của MVP. \n \n 4. Tài Khoản. \n Đê sử dụng Ứng Dụng bạn phải liên hệ trực tiếp với Group IT MVP để được cấp tài khoản theo từng mã số nhân viên, đồng thời thông tin chúng tôi cung cấp phải được bảo mật riêng cá nhân từng người. "
        text.font = UIFont.init(name: "Times New Roman", size: 15)
        text.numberOfLines = 0
        text.textAlignment = .natural
        text.textColor = .black
        
        return text
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor(red:0.086, green:0.510, blue:0.973, alpha: 1.000),NSAttributedString.Key.font: UIFont(name: "Arial", size: 19)!]
        navigationItem.title = "Chính sách và điều khoản"
        
        view.backgroundColor = .white
        addSub(); setlayOut()
    }
    
    func addSub(){
        view.addSubview(contaiverView)
        contaiverView.addSubview(ScrollView)
        ScrollView.addSubview(contentView)
        contentView.addSubview(textTieuDe)
        contentView.addSubview(textContent)
    }
    
    func setlayOut(){
        contaiverView.topAnchor.constraint(equalTo: view.layoutMarginsGuide.topAnchor, constant: 0).isActive = true
        contaiverView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0).isActive = true
        contaiverView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0).isActive = true
        contaiverView.bottomAnchor.constraint(equalTo: view.layoutMarginsGuide.bottomAnchor, constant: 0).isActive = true
        
        ScrollView.topAnchor.constraint(equalTo: view.layoutMarginsGuide.topAnchor, constant: 20).isActive = true
        ScrollView.leadingAnchor.constraint(equalTo: contaiverView.leadingAnchor, constant: 10).isActive = true
        ScrollView.trailingAnchor.constraint(equalTo: contaiverView.trailingAnchor, constant: -10).isActive = true
        ScrollView.bottomAnchor.constraint(equalTo: view.layoutMarginsGuide.bottomAnchor, constant: -20).isActive = true
        
        contentView.topAnchor.constraint(equalTo: ScrollView.topAnchor, constant: 0).isActive = true
        contentView.leadingAnchor.constraint(equalTo: ScrollView.leadingAnchor, constant: 0).isActive = true
        contentView.trailingAnchor.constraint(equalTo: ScrollView.trailingAnchor, constant: 0).isActive = true
        contentView.bottomAnchor.constraint(equalTo: ScrollView.bottomAnchor, constant: 0).isActive = true
        contentView.widthAnchor.constraint(equalTo: ScrollView.widthAnchor, constant: 0).isActive = true
        contentView.heightAnchor.constraint(equalToConstant: 800).isActive = true
        
        textTieuDe.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 20).isActive = true
        textTieuDe.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 0).isActive = true
        textTieuDe.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: 0).isActive = true
        
        textContent.topAnchor.constraint(equalTo: textTieuDe.topAnchor, constant: 20).isActive = true
        textContent.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10).isActive = true
        textContent.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10).isActive = true
        
    }
}
