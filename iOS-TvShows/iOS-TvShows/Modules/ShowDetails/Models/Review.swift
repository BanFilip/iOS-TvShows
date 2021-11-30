//
//  Review.swift
//  iOS-TvShows
//
//  Created by Filip Ban on 29.11.2021..
//

import Foundation

struct Review: Codable {
    let id: String
    let comment: String?
    let rating: Int
    let user: User
}

struct ReviewsResponse: Codable {
    let reviews: [Review]
}
