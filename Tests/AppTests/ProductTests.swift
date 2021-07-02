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
    
    func testGetProductById() throws {
        let app = Application(.testing)
        defer { app.shutdown() }
        try configure(app)
    
        let paramRequest = GetProductByIdRequest(idProduct: 123)
        
        try app.test(.GET, "getProductById",beforeRequest: { request in
            try request.query.encode(paramRequest)
        }, afterResponse: { response in
            let getAllProductResponse = try response.content.decode(GetProductByIdResponse.self)
            XCTAssertEqual(response.status, .ok)
            XCTAssertEqual(getAllProductResponse.result, 1)
           
        })
    }
 
    
    
}

