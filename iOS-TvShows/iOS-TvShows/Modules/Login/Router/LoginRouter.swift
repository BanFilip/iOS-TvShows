//
//  LoginRouter.swift
//
//  Created by Filip Gulan on 25/04/2019.
//  Copyright © 2019 Infinum. All rights reserved.
//

import Foundation
import Alamofire

class LoginRouter: Router {

    static let baseUrl = "https://tv-shows.infinum.academy"
    static let usersPath = "/users"

    static func login(email: String, password: String) -> LoginRouter {
        let params = [
            "email": email,
            "password": password
        ]
        return LoginRouter(
            baseUrl: baseUrl,
            path: "\(usersPath)/sign_in",
            method: .post,
            parameters: params,
            encoding: JSONEncoding.default
        )
    }

    static func register(email: String, password: String) -> LoginRouter {
        let params = [
            "email": email,
            "password": password
        ]
        return LoginRouter(
            baseUrl: baseUrl,
            path: usersPath,
            method: .post,
            parameters: params,
            encoding: JSONEncoding.default
        )
    }
}
