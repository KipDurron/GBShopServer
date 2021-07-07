//
//  File.swift
//  
//
//  Created by Илья Кадыров on 07.07.2021.
//

import Vapor

class BasketController {
    
    func addToBasket(_ req: Request) throws -> EventLoopFuture<StandartResponse> {

        guard let body = try? req.content.decode(ItemOfBasket.self) else {
            throw Abort(.badRequest)
        }
        
        print(body)
        
        let response = StandartResponse(
            result: 1
        )
        
        return req.eventLoop.future(response)
    }
    
    func deleteFromBasket(_ req: Request) throws -> EventLoopFuture<StandartResponse> {

        guard let body = try? req.query.decode(DeleteFromBasketRequest.self) else {
            throw Abort(.badRequest)
        }
        
        print(body)
        
        let response = StandartResponse(
            result: 1
        )
        
        return req.eventLoop.future(response)
    }
    
    func payBasket(_ req: Request) throws -> EventLoopFuture<StandartResponse> {
        guard let body = try? req.content.decode(GetByUserIdRequest.self) else {
            throw Abort(.badRequest)
        }

        print(body)
        
        let getBasketResponse = self.getBasket(idUser: body.id)
        let balance: Float = 1000.0
        var priceAllBasket: Float = 0.0
        for product in getBasketResponse.contents {
            priceAllBasket += product.price
        }
        guard balance - priceAllBasket >= 0 else {
            return req.eventLoop.future(StandartResponse(result: 0, errorMessage: "low balance"))
        }

        return req.eventLoop.future(StandartResponse(result: 1))
    }
    
    func getBasket(idUser: Int) -> GetBasketResponse {

        return GetBasketResponse(result: 1, amount: 2,
                                 contents: [Product(id: 123, name: "Ноутбук", price: 45600, description: "Описание"),
                                            Product(id: 456, name: "Мышка", price: 1000, description: "Описание")])
    }
    
}

