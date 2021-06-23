//
//  DataHotel.swift
//  purwakartaku
//
//  Created by oratakashi on 15/06/21.
//

import Foundation

struct DataHotel : Decodable{
    let id : Int?
    let nama : String
    let alamat : String
    let nomor_telp : String
    let kordinat : String
    let gambar_url : String
}
