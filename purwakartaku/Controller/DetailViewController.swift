//
//  DetailViewController.swift
//  purwakartaku
//
//  Created by oratakashi on 20/06/21.
//

import UIKit
import SDWebImage
import MapKit

class DetailViewController: UIViewController {
    
    @IBOutlet weak var ivImage: UIImageView!
    @IBOutlet weak var tvTitle: UILabel!
    @IBOutlet weak var tvAddress: UILabel!
    @IBOutlet weak var tvPhone: UILabel!
    @IBOutlet weak var mkMaps: MKMapView!
    
    var hotel: DataHotel? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if hotel != nil {
            self.title = "Detail Hotel"
            ivImage.sd_setImage(with: URL(string: hotel!.gambar_url), completed: nil)
            tvTitle.text = hotel?.nama
            tvAddress.text = hotel?.alamat
            tvPhone.text = hotel?.nomor_telp
        }
        // Do any additional setup after loading the view.
    }
}

extension MKMapView {
    func fitAll(in annotation: MKAnnotation) {
        var zoomRect            = MKMapRect.null;
        let annotationPoint = MKMapPoint(annotation.coordinate)
        let pointRect       = MKMapRect(x: annotationPoint.x, y: annotationPoint.y, width: 0.01, height: 0.01);
        zoomRect            = zoomRect.union(pointRect);
        setVisibleMapRect(zoomRect, edgePadding: UIEdgeInsets(top: 100, left: 100, bottom: 100, right: 100), animated: true)
    }
}
