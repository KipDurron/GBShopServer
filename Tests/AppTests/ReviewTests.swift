//
//  File.swift
//  
//
//  Created by Илья Кадыров on 04.07.2021.
//

@testable import App
import XCTVapor

final class ReviewTests: XCTestCase {
    
    var reviewController: ReviewController!

    override func setUpWithError() throws {
        self.reviewController = ReviewController()
    }

    override func tearDownWithError() throws {
        self.reviewController = nil
    }
    
    func testGetAllReview() throws {
        let app = Application(.testing)
        defer { app.shutdown() }
        try configure(app)
        
        try app.test(.GET, "getAllReview", afterResponse: { response in
            let getAllReviewResponse = try response.content.decode(GetAllReviewResponse.self)
            XCTAssertEqual(response.status, .ok)
            XCTAssertEqual(getAllReviewResponse.result, 1)
           
        })
    }
    
    func testAddReview() throws {
        let app = Application(.testing)
        defer { app.shutdown() }
        try configure(app)
    
        let paramRequest = AddReviewRequest(idUser: 123, idProduct: 456, text: "Текст отзыва")
        
        try app.test(.POST, "addReview",beforeRequest: { request in
            try request.content.encode(paramRequest)
        }, afterResponse: { response in
            let body = try response.content.decode(StandartResponse.self)
            XCTAssertEqual(response.status, .ok)
            XCTAssertEqual(body.result, 1)
           
        })
    }
 
    func testDeleteReview() throws {
        let app = Application(.testing)
        defer { app.shutdown() }
        try configure(app)
    
        let paramRequest = DeleteReviewRequest(idReview: 123)
        
        try app.test(.DELETE, "deleteReview",beforeRequest: { request in
            try request.query.encode(paramRequest)
        }, afterResponse: { response in
            let body = try response.content.decode(StandartResponse.self)
            XCTAssertEqual(response.status, .ok)
            XCTAssertEqual(body.result, 1)
           
        })
    }
    
}


