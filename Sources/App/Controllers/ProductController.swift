//
//  File.swift
//  
//
//  Created by Илья Кадыров on 02.07.2021.
//

import Vapor

class ProductController {
    
    func getAllProduct(_ req: Request) throws -> EventLoopFuture<GetAllProductResponse> {

        guard let body = try? req.query.decode(GetAllProductRequest.self) else {
            throw Abort(.badRequest)
        }
        
        print(body)
        
        let response = GetAllProductResponse(result: 1, pageNumber: 1,
                                             products: [Product(id: 123, name: "Ноутбук", price: 45600, description: "Описание"),
                                                        Product(id: 456, name: "Мышка", price: 1000, description: "Описание")])
        
        return req.eventLoop.future(response)
    }
    
    func login(_ req: Request) throws -> EventLoopFuture<LoginResponse> {
        guard let body = try? req.query.decode(LoginRequest.self) else {
            throw Abort(.badRequest)
        }

        print(body)
        
//        do {
//            try req.query.decode(LoginRequest.self)
//        } catch  {
//            print("Неожиданная ошибка: \(error).")
//        }
        
        let response = LoginResponse(
            result: 1,
            user: User(id: 123, login: "geekbrains", name: "John", lastname: "Doe")
        )
        
        return req.eventLoop.future(response)
    }
    
    func changeUserData(_ req: Request) throws -> EventLoopFuture<StandartResponse> {

        guard let body = try? req.content.decode(ChangeUserDataRequest.self) else {
            throw Abort(.badRequest)
        }
        
        print(body)
        
        let response = StandartResponse(
            result: 1,
            errorMessage: nil
        )
        
        return req.eventLoop.future(response)
    }
    
    func logout(_ req: Request) throws -> EventLoopFuture<StandartResponse> {
        guard let body = try? req.query.decode(LogoutRequest.self) else {
            throw Abort(.badRequest)
        }

        print(body)
        
        let response = StandartResponse(
            result: 1,
            errorMessage: nil
        )
        
        return req.eventLoop.future(response)
    }
    
    
    
}
