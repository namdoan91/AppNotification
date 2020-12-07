//
//  UIBarButtonItem.swift
//  AppNotification
//
//  Created by namit on 07/12/2020.
//
import Foundation
import UIKit
class ImageBarButton : UIView {
    var imageView: UIImageView!
    var button: UIButton!

    convenience init(withUrl imageURL: URL? = nil, withImage image: UIImage? = nil, frame: CGRect = CGRect(x: 0, y: 0, width: 40, height: 40)) {
        self.init(frame: frame)

        imageView = UIImageView(frame: frame)
        imageView.backgroundColor = .white
        imageView.layer.cornerRadius = frame.height/2
        imageView.clipsToBounds = true
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        addSubview(imageView)

        button = UIButton(frame: frame)
        button.backgroundColor = .clear
        button.setTitle("", for: .normal)
        addSubview(button)

        if let url = imageURL { // you can use pods like Nuke or Kingfisher
         URLSession(configuration: .default).dataTask(with: URL(string: "\(imageURL!)")) {[weak self] (data, response, error) in
          if let data = data , let image = UIImage(data: data) {
              DispatchQueue.main.async {
                self?.imageView.image = image
              }
           }
         }.resume()
        } else if let image = image {
            self.imageView.image = image
        }
    }

    func load()-> UIBarButtonItem {
        return UIBarButtonItem(customView: self)
    }
}
