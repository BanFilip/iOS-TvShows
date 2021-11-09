//
//  AuthModel.swift
//  iOS-TvShows
//
//  Created by Filip Ban on 08.11.2021..
//

import Foundation

struct AuthInfo: Codable {

    let uid: String?
    let accessToken: String?
    let client: String?
    let expiry: String?
    let tokenType: String?
    let contentType: String?

    init(from response: HTTPURLResponse) {
        uid = response.headers.dictionary["uid"]
        accessToken = response.headers.dictionary["access-token"]
        client = response.headers.dictionary["client"]
        expiry = response.headers.dictionary["expiry"]
        tokenType = response.headers.dictionary["token-type"]
        contentType = response.headers.dictionary["Content-Type"]
    }
}
