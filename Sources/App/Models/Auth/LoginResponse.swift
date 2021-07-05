//
//  File.swift
//  
//
//  Created by Илья Кадыров on 01.07.2021.
//

import Vapor

struct LoginResponse: Content {
    let result: Int
    let user: User
    var errorMessage: String?
}
