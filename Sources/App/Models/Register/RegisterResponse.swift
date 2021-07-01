//
//  File.swift
//  
//
//  Created by Илья Кадыров on 01.07.2021.
//

import Vapor

struct RegisterResponse: Content {
    var result: Int
    var user_message: String?
    var error_message: String?
}
