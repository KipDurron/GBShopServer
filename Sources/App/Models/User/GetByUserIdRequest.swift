//
//  File.swift
//  
//
//  Created by Илья Кадыров on 07.07.2021.
//

import Vapor

struct GetByUserIdRequest: Content {
    let id: Int

    enum CodingKeys: String, CodingKey {
        case id = "id_user"

    }
}
