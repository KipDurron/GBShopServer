//
//  File.swift
//  
//
//  Created by Илья Кадыров on 04.07.2021.
//

import Vapor

struct Review: Content {
    var id: Int
    var text: String
    var idUser: Int
    var idProduct: Int
    
    enum CodingKeys: String, CodingKey {
        case id = "id_review"
        case text = "text"
        case idUser = "id_user"
        case idProduct = "id_product"
    }
}
