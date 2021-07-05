//
//  File.swift
//  
//
//  Created by Илья Кадыров on 04.07.2021.
//

import Vapor

struct GetAllReviewResponse: Content {
    
    let result: Int
    let pageNumber: Int
    var errorMessage: String?
    let reviews: [Review]
    
    enum CodingKeys: String, CodingKey {
        case result = "result"
        case pageNumber = "page_number"
        case reviews = "reviews"
        case errorMessage = "error_message"
    }
}
