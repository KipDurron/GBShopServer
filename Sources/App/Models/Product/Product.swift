//
//  File.swift
//  
//
//  Created by Илья Кадыров on 02.07.2021.
//

import Vapor

struct Product: Content {
    
    let id: Int
    let name: String
    let price: Float
    let description: String
    
    enum CodingKeys: String, CodingKey {
        case id = "id_product"
        case name = "product_name"
        case price = "product_price"
        case description = "product_description"
    }
}
