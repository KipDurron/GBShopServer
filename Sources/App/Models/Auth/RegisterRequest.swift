//
//  File.swift
//  
//
//  Created by Илья Кадыров on 01.07.2021.
//


import Vapor

struct RegisterRequest: Content {
    var username: String
    var password: String
    var email: String
    var gender: String
    var creditCard: String
    var bio: String
    
    enum CodingKeys: String, CodingKey {
        case password = "password"
        case email = "email"
        case gender = "gender"
        case creditCard = "credit_card"
        case bio = "bio"
        case username = "username"
    }
}
