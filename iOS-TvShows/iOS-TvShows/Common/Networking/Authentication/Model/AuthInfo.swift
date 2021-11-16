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

    init(from response: HTTPURLResponse) {
        uid = response.headers.dictionary[Constants.RequestInterceptor.uid]
        accessToken = response.headers.dictionary[Constants.RequestInterceptor.accessToken]
        client = response.headers.dictionary[Constants.RequestInterceptor.client]
        expiry = response.headers.dictionary[Constants.RequestInterceptor.expiry]
        tokenType = response.headers.dictionary[Constants.RequestInterceptor.tokenType]
    }
}
