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
    @IBOutlet weak var tvOpenHour: UILabel!
    @IBOutlet weak var tvCategory: UILabel!
    
    var hotel: DataHotel? = nil
    var kuliner: DataKuliner? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        ivImage.layer.cornerRadius = 15
        if hotel != nil {
            self.title = "Detail Hotel"
            ivImage.sd_setImage(with: URL(string: hotel!.gambar_url), completed: nil)
            tvTitle.text = hotel?.nama
            tvAddress.text = hotel?.alamat
            tvPhone.text = hotel?.nomor_telp
            tvOpenHour.text = "SETIAP HARI 00:00 WIB - 23:59 WIB"
            tvCategory.text = "Penginapan"
        } else if kuliner != nil {
            self.title = "Detail Kuliner"
            ivImage.sd_setImage(with: URL(string: kuliner!.gambar_url), completed: nil)
            tvTitle.text = kuliner?.nama
            tvAddress.text = kuliner?.alamat
            tvPhone.text = "-"
            tvOpenHour.text = kuliner?.jam_buka_tutup.uppercased()
            tvCategory.text = kuliner?.kategori
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
