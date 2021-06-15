//
//  ViewController.swift
//  purwakartaku
//
//  Created by oratakashi on 15/06/21.
//

import UIKit
import Alamofire

class ViewController: UIViewController {

    @IBOutlet weak var rvHotel: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getHotel(){ (it) in
            switch it {
            case .failure(let error):
                print(error.localizedDescription)
            case .success(let data) :
                dump(data)
            }
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
            dump(result.value?.hotel)
            guard result.response!.statusCode == 200 else { return }
            completion(.success(result.value!))
        }
    }
}
