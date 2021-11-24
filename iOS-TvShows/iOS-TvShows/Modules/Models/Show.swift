//
//  Show.swift
//  iOS-TvShows
//
//  Created by Filip Ban on 24.11.2021..
//

import Foundation

struct Show: Codable {
    let id: String
    let averageRating: Double?
    let description: String?
    let imageUrl: String?
    let noOfReviews: Int
    let title: String

    enum CodingKeys: String, CodingKey {
        case id, description, title
        case averageRating = "average_rating"
        case imageUrl = "image_url"
        case noOfReviews = "no_of_reviews"
    }
}

struct ShowsResponse: Codable {
    let shows: [Show]
}

struct ShowResponse: Codable {
    let show: Show
}
