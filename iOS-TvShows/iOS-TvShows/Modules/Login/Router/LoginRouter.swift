//
//  LoginRouter.swift
//
//  Created by Filip Gulan on 25/04/2019.
//  Copyright © 2019 Infinum. All rights reserved.
//

import Foundation
import Alamofire

class LoginRouter: Router {

    static func login(email: String, password: String) -> LoginRouter {
        let params = [
            "email": email,
            "password": password
        ]
        return LoginRouter(
            path: "/users/sign_in",
            method: .post,
            parameters: params
        )
    }

    static func register(email: String, password: String) -> LoginRouter {
        let params = [
            "email": email,
            "password": password
        ]
        return LoginRouter(
            path: "/users",
            method: .post,
            parameters: params
        )
    }
}
