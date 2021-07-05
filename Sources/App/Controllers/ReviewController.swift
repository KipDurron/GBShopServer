//
//  File.swift
//  
//
//  Created by Илья Кадыров on 04.07.2021.
//

import Vapor

class ReviewController {
    
    func getAllReview(_ req: Request) throws -> EventLoopFuture<GetAllReviewResponse> {

       
        
        let response = GetAllReviewResponse(result: 1, pageNumber: 1, errorMessage: nil,
                                             reviews: [Review(id: 1, text: "Review_1", idUser: 2, idProduct: 345),
                                                        Review(id: 2, text: "Review_2", idUser: 3, idProduct: 678)])
        
        return req.eventLoop.future(response)
    }
    
    func addReview(_ req: Request) throws -> EventLoopFuture<StandartResponse> {

        guard let body = try? req.content.decode(AddReviewRequest.self) else {
            throw Abort(.badRequest)
        }
        
        print(body)
        
        let response = StandartResponse(result: 1, errorMessage: nil, userMessage: "Ваш отзыв был передан на модерацию")
        
        return req.eventLoop.future(response)
    }
    
    func deleteReview(_ req: Request) throws -> EventLoopFuture<StandartResponse> {
        guard let body = try? req.query.decode(DeleteReviewRequest.self) else {
            throw Abort(.badRequest)
        }

        print(body)
        
        
        let response = StandartResponse(result: 1, errorMessage: nil, userMessage: nil)
        
        return req.eventLoop.future(response)
    }
    
    
    
}

