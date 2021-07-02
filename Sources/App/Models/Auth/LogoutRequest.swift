//
//  File.swift
//  
//
//  Created by Илья Кадыров on 02.07.2021.
//

import Vapor

struct LogoutRequest: Content {
    
    let id: Int
    enum CodingKeys: String, CodingKey {
        case id = "id_user"
    }

}
