//
//  File.swift
//  
//
//  Created by Илья Кадыров on 07.07.2021.
//

import Vapor

struct ItemOfBasket: Content {
    
    let idProduct: Int
    let idUser: Int
    let quantity: Int
    
    enum CodingKeys: String, CodingKey {
        case idProduct = "id_product"
        case idUser = "id_user"
        case quantity = "quantity"
    }
}

