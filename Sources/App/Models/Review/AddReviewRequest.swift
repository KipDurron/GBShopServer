//
//  File.swift
//  
//
//  Created by Илья Кадыров on 05.07.2021.
//

import Vapor

struct AddReviewRequest: Content {
    
    let idUser: Int
    let idProduct: Int
    let text: String
    
    enum CodingKeys: String, CodingKey {
        case idUser = "id_user"
        case idProduct = "id_product"
        case text = "text"
    }
}
