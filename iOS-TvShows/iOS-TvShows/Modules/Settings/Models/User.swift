//
//  User.swift
//  iOS-TvShows
//
//  Created by Filip Ban on 25.11.2021..
//

import Foundation

struct User: Codable {
    let id: String
    let email: String
    let imageUrl: String?

    enum CodingKeys: String, CodingKey {
        case id, email
        case imageUrl = "image_url"
    }
}

struct UserResponse: Codable {
    let user: User
}
