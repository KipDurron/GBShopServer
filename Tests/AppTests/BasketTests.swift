//
//  File.swift
//  
//
//  Created by Илья Кадыров on 07.07.2021.
//

@testable import App
import XCTVapor

final class BasketTests: XCTestCase {
    
    var basketController: BasketController!

    override func setUpWithError() throws {
        self.basketController = BasketController()
    }

    override func tearDownWithError() throws {
        self.basketController = nil
    }
    
    func testAddToBasket() throws {
        let app = Application(.testing)
        defer { app.shutdown() }
        try configure(app)
    
        let paramRequest = ItemOfBasket(idProduct: 123, idUser: 456, quantity: 1)
        
        try app.test(.POST, "addToBasket",beforeRequest: { request in
            try request.content.encode(paramRequest)
        }, afterResponse: { response in
            let body = try response.content.decode(StandartResponse.self)
            XCTAssertEqual(response.status, .ok)
            XCTAssertEqual(body.result, 1)
           
        })
    }
    
    func testDeleteFromBasket() throws {
        let app = Application(.testing)
        defer { app.shutdown() }
        try configure(app)
    
        let paramRequest = DeleteFromBasketRequest(idUser: 123, idProduct: 456)
        
        try app.test(.DELETE, "deleteFromBasket",beforeRequest: { request in
            try request.query.encode(paramRequest)
        }, afterResponse: { response in
            let body = try response.content.decode(StandartResponse.self)
            XCTAssertEqual(response.status, .ok)
            XCTAssertEqual(body.result, 1)
           
        })
    }
 
    func testPayBasket() throws {
        let app = Application(.testing)
        defer { app.shutdown() }
        try configure(app)
    
        let paramRequest = GetByUserIdRequest(id:123)
        
        try app.test(.POST, "payBasket",beforeRequest: { request in
            try request.content.encode(paramRequest)
        }, afterResponse: { response in
            let body = try response.content.decode(StandartResponse.self)
            XCTAssertEqual(response.status, .ok)
            XCTAssertEqual(body.result, 0)
           
        })
    }
    
}


