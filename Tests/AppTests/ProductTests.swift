//
//  File.swift
//  
//
//  Created by Илья Кадыров on 02.07.2021.
//

@testable import App
import XCTVapor

final class ProductTests: XCTestCase {
    
    var productController: ProductController!

    override func setUpWithError() throws {
        self.productController = ProductController()
    }

    override func tearDownWithError() throws {
        self.productController = nil
    }
    
    func testGetAllProduct() throws {
        let app = Application(.testing)
        defer { app.shutdown() }
        try configure(app)
    
        let paramRequest = GetAllProductRequest(pageNumber: 1, idCategory: 1)
        
        try app.test(.GET, "getAllProduct",beforeRequest: { request in
            try request.query.encode(paramRequest)
        }, afterResponse: { response in
            let getAllProductResponse = try response.content.decode(GetAllProductResponse.self)
            XCTAssertEqual(response.status, .ok)
            XCTAssertEqual(getAllProductResponse.result, 1)
           
        })
    }
    
    func testLogout() throws {
        let app = Application(.testing)
        defer { app.shutdown() }
        try configure(app)
    
        let logoutRequest = LogoutRequest(id: 123)
        
        try app.test(.GET, "logout",beforeRequest: { request in
            try request.query.encode(logoutRequest)
        }, afterResponse: { response in
            let logoutResponse = try response.content.decode(StandartResponse.self)
            XCTAssertEqual(response.status, .ok)
            XCTAssertEqual(logoutResponse.result, 1)
           
        })
    }
    
    func testRegistration() throws {
        let app = Application(.testing)
        defer { app.shutdown() }
        try configure(app)
        
        let registerRequest = RegisterRequest(username: "Somebody", password: "mypassword", email: "some@some.ru", gender: "m", creditCard: "9872389-2424-234224-234", bio: "This is good! I think I will switch to another language")
        
        try app.test(.POST, "register",beforeRequest: { request in
            try request.content.encode(registerRequest)
        }, afterResponse: { response in
            let registerResponse = try response.content.decode(StandartResponse.self)
            XCTAssertEqual(response.status, .ok)
            XCTAssertEqual(registerResponse.result, 1)
            
        })
    }
    

    
    func testChangeUserData() throws {
        let app = Application(.testing)
        defer { app.shutdown() }
        try configure(app)
        
        let user = User(id: 123, login: "", name: "Somebody", lastname: "lastname")
        
        let extraUserInfo = ExtraUserInfo(id: user.id, password: "mypassword", email: "some@some.ru", gender: "m", creditCard: "9872389-2424-234224-234", bio: "This is good! I think I will switch to another language")
        
        let changeUserDataRequest = ChangeUserDataRequest(idUser: user.id, username: user.name, password: extraUserInfo.password,
                                                          email: extraUserInfo.email, gender: extraUserInfo.gender,
                                                          creditCard: extraUserInfo.creditCard, bio: extraUserInfo.bio)
        
        try app.test(.PUT, "changeUserData",beforeRequest: { request in
            try request.content.encode(changeUserDataRequest)
        }, afterResponse: { response in
            let changeUserDataResponse = try response.content.decode(StandartResponse.self)
            XCTAssertEqual(response.status, .ok)
            XCTAssertEqual(changeUserDataResponse.result, 1)
            
        })
    }
    
 
    
    
}

