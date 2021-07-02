//
//  File.swift
//  
//
//  Created by Илья Кадыров on 02.07.2021.
//

import Vapor

struct GetAllProductRequest: Content {
    
    let pageNumber: Int
    let idCategory: Int
    
    enum CodingKeys: String, CodingKey {
        case pageNumber = "page_number"
        case idCategory = "id_category"
    }
}
