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

struct ReviewsResponse: Decodable {
    let reviews: [Review]
    let pagination: Pagination

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        reviews = try values.decode([Review].self, forKey: .reviews)
        let metaKeys = try values.nestedContainer(keyedBy: MetaKeys.self, forKey: .meta)
        pagination = try metaKeys.decode(Pagination.self, forKey: .pagination)
    }

    enum CodingKeys: String, CodingKey {
        case reviews
        case meta
    }

    enum MetaKeys: String, CodingKey {
        case pagination
    }
}
