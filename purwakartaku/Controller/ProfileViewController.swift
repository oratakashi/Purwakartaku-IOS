//
//  ProfileViewController.swift
//  purwakartaku
//
//  Created by oratakashi on 23/06/21.
//

import UIKit
import SDWebImage

class ProfileViewController: UIViewController {

    @IBOutlet weak var ivPhoto: UIImageView!
    @IBOutlet weak var ivBackground: UIImageView!
    @IBOutlet weak var btnGit: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        ivPhoto.setRounded()
        ivBackground.sd_setImage(with: URL(string: "https://techburner.in/wp-content/uploads/2021/06/hero_desktop__buokcfsx51py_large-compressed.jpg"), completed: nil)
        btnGit.backgroundColor = .blue
        btnGit.layer.cornerRadius = 8
    }
    
    @IBAction func openGithub(sender: AnyObject) {
        if let url = URL(string: "https://github.com/oratakashi") {
            if #available(iOS 10, *){
                UIApplication.shared.open(url)
            }else{
                UIApplication.shared.openURL(url)
            }
            
        }
    }
}

extension UIImageView {
    func setRounded() {
        self.layer.cornerRadius = (self.frame.width / 2) //instead of let radius = CGRectGetWidth(self.frame) / 2
        self.layer.masksToBounds = true
    }
}

