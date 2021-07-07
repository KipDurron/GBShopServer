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
    
    func getProductById(_ req: Request) throws -> EventLoopFuture<GetProductByIdResponse> {

        guard let body = try? req.query.decode(GetProductByIdRequest.self) else {
            throw Abort(.badRequest)
        }
        
        print(body)
        
        let response = GetProductByIdResponse(result: 1,
                                             product: Product(id: 123, name: "Название", price: 123, description: "Описание"))
        
        return req.eventLoop.future(response)
    }
    
}
