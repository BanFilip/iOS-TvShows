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

struct Pagination: Codable {
    let page: Int
    let items: Int
    let pages: Int
}

struct ShowsResponse: Decodable {
    let shows: [Show]
    let pagination: Pagination

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        shows = try values.decode([Show].self, forKey: .shows)
        let metaKeys = try values.nestedContainer(keyedBy: MetaKeys.self, forKey: .meta)
        pagination = try metaKeys.decode(Pagination.self, forKey: .pagination)
    }

    enum CodingKeys: String, CodingKey {
        case shows
        case meta
    }

    enum MetaKeys: String, CodingKey {
        case pagination
    }
}

struct ShowResponse: Codable {
    let show: Show
}
