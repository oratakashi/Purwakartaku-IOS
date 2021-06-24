//
//  KulinerViewController.swift
//  purwakartaku
//
//  Created by oratakashi on 24/06/21.
//

import UIKit
import Alamofire
import SDWebImage

class KulinerViewController: UIViewController {

    @IBOutlet weak var rvKuliner: UITableView!
    
    var data :Array = [DataKuliner]()
    
    let alert = UIAlertController(title: nil, message: "Please wait...", preferredStyle: .alert)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        rvKuliner.dataSource = self
        rvKuliner.register(UINib(nibName: "TableViewCell", bundle: nil), forCellReuseIdentifier: "TableViewCell")
        rvKuliner.delegate = self

        let loadingIndicator = UIActivityIndicatorView(frame: CGRect(x: 10, y: 5, width: 50, height: 50))
        loadingIndicator.hidesWhenStopped = true
        loadingIndicator.style = UIActivityIndicatorView.Style.medium
        loadingIndicator.startAnimating();
        alert.view.addSubview(loadingIndicator)
        
        getKuliner(){ (it) in
            switch it {
                case .failure(let error):
                    print(error.localizedDescription)
                case .success(let data) :
                    dump(data)
                    self.data.removeAll()
                    data.kuliner.forEach { (row) in
                        self.data.append(row)
                        self.rvKuliner.reloadData()
                    }
            }
        }
    }
}

extension KulinerViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt position: IndexPath) {
        guard let detail = UIStoryboard(
            name: "Main",
            bundle: nil
        ).instantiateViewController(
            withIdentifier: "DetailViewController"
        ) as? DetailViewController else { return }
        detail.kuliner = data[position.row]
        self.navigationController?.pushViewController(detail, animated: true)
    }
}

extension KulinerViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt position: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "TableViewCell", for: position) as? TableViewCell {
            cell.ivImage.sd_setImage(with: URL(string: data[position.row].gambar_url), completed: nil)
            cell.ivImage.layer.cornerRadius = 15
            cell.tvName.text = data[position.row].nama
            cell.tvAddress.text = data[position.row].alamat
            return cell
        }else{
            return UITableViewCell()
        }
    }
}

extension KulinerViewController {
    func getKuliner(completion: @escaping (Result<ResponseKuliner, Error>) ->()) {
        let headers: HTTPHeaders = ["Accept": "application/json"]
        present(alert, animated: true, completion: nil)
        AF.request(Config().BASE_URL + "kuliner", headers: headers).responseDecodable(of: ResponseKuliner.self){ (result) in
            if let error = result.error {
                self.dismiss(animated: false, completion: nil)
                completion(.failure(error))
            }
            guard result.response!.statusCode == 200 else { return }
            self.dismiss(animated: false, completion: nil)
            completion(.success(result.value!))
        }
    }
}
