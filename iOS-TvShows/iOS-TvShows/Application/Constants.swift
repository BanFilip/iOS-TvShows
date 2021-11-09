//
//  Constants.swift
//  iOS-TvShows
//
//  Created by Filip Ban on 08.11.2021..
//

enum Constants {

    enum Keychain {
        static let serviceName = "com.filipBan.iOS-TvShows"

        enum Keys {
            static let authInfo = "authInfo"
        }
    }

    enum RequestInterceptor {
        static let uid = "uid"
        static let accessToken = "access-token"
        static let client = "client"
        static let accept = "accept"
        static let expiry = "expiry"
        static let tokenType = "token-type"
        static let acceptFormat = "application/json"
        static let bearer = "Bearer"
        static let contentType = "application/json"
    }

}
