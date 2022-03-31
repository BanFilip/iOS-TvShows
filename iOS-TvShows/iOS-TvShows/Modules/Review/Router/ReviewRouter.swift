//
//  ReviewRouter.swift
//  iOS-TvShows
//
//  Created by Filip Ban on 30.11.2021..
//

import Foundation
import Alamofire

class ReviewRouter: Router {

    static func reviews(with id: String, params: [String: Int]) -> ReviewRouter {
        return ReviewRouter(
            path: "/shows/\(id)/reviews",
            method: .get,
            parameters: params
        )
    }

    static func submitReview(with params: [String: Any]) -> ReviewRouter {
        return ReviewRouter(
            path: "/reviews",
            method: .post,
            parameters: params
        )
    }
}
