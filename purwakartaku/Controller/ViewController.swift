//
//  ViewController.swift
//  purwakartaku
//
//  Created by oratakashi on 15/06/21.
//

import UIKit
import Alamofire
import SDWebImage

class ViewController: UIViewController {

    @IBOutlet weak var rvHotel: UITableView!
    
    var data :Array = [DataHotel]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        rvHotel.dataSource = self
        rvHotel.register(UINib(nibName: "HotelTableViewCell", bundle: nil), forCellReuseIdentifier: "HotelTableViewCell")
        getHotel(){ (it) in
            switch it {
            case .failure(let error):
                print(error.localizedDescription)
            case .success(let data) :
                dump(data)
                self.data.removeAll()
                data.hotel.forEach { (row) in
                    self.data.append(row)
                    self.rvHotel.reloadData()
                }
            }
        }
    }

    
}

extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    }
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt position: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "HotelTableViewCell", for: position) as? HotelTableViewCell {
            cell.ivImage.sd_setImage(with: URL(string: data[position.row].gambar_url), completed: nil)
            cell.tvName.text = data[position.row].nama
            cell.tvAddress.text = data[position.row].alamat
            return cell
        }else{
            return UITableViewCell()
        }
    }
}

extension ViewController {
    func getHotel(completion: @escaping (Result<ResponseHotel, Error>) ->()) {
        let headers: HTTPHeaders = ["Accept": "application/json"]
        
        AF.request(Config().BASE_URL + "hotel", headers: headers).responseDecodable(of: ResponseHotel.self){ (result) in
            if let error = result.error {
                completion(.failure(error))
            }
            guard result.response!.statusCode == 200 else { return }
            completion(.success(result.value!))
        }
    }
}
