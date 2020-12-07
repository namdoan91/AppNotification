//
//  UIBarImageView.swift
//  AppNotification
//
//  Created by namit on 07/12/2020.
//

import Foundation
import UIKit
import Alamofire
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
            AF.request( url,method: .get).response{ response in

             switch response.result {
              case .success(let responseData):
                  self.imageView.image = UIImage(data: responseData!, scale:1)

              case .failure(let error):
                  print("error--->",error)
              }
          }
        }
        
    }
    func load()-> UIBarButtonItem {
        return UIBarButtonItem(customView: self)
    }
    
}
