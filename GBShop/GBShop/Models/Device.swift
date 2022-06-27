//
//  Device.swift
//  GBShop
//
//  Created by Григорий Виняр on 26/06/2022.
//

import Foundation

struct Device: Decodable {
    let id: Int?
    let name: String?
    let price: Int?
    
    enum CondingKeys: String, CodingKey {
        case id = "id_product"
        case name = "product_name"
        case price
    }
}
