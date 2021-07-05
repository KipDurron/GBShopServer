//
//  File.swift
//  
//
//  Created by Илья Кадыров on 01.07.2021.
//

import Vapor

struct StandartResponse: Content {
    var result: Int
    var errorMessage: String?
    
    enum CodingKeys: String, CodingKey {

        case result = "result"
        case errorMessage = "error_message"
    }
}
