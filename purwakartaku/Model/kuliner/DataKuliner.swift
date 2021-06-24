//
//  DataKuliner.swift
//  purwakartaku
//
//  Created by oratakashi on 23/06/21.
//

import Foundation

struct DataKuliner : Decodable {
    let id : Int?
    let nama : String
    let alamat : String
    let jam_buka_tutup : String
    let kordinat : String
    let gambar_url : String
    let kategori : String
}
