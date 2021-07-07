//
//  File.swift
//  
//
//  Created by Илья Кадыров on 07.07.2021.
//

import Vapor

struct GetBasketResponse: Content {
    
    let result: Int
    let amount: Int
    var errorMessage: String?
    let contents: [Product]
    
    enum CodingKeys: String, CodingKey {
        case result = "result"
        case amount = "amount"
        case contents = "contents"
        case errorMessage = "error_message"
    }
}
