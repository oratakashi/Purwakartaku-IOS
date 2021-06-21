//
//  DetailViewController.swift
//  purwakartaku
//
//  Created by oratakashi on 20/06/21.
//

import UIKit

class DetailViewController: UIViewController {
    
    var hotel: DataHotel? = nil

    override func viewDidLoad() {
        super.viewDidLoad()
        if hotel != nil {
            self.title = hotel?.nama
        }
        // Do any additional setup after loading the view.
    }
    

    

}
