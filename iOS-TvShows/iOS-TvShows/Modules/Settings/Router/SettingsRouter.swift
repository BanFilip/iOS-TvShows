//
//  SettingsRouter.swift
//  iOS-TvShows
//
//  Created by Filip Ban on 25.11.2021..
//

import Foundation
import Alamofire

class SettingsRouter: Router {

    static var user: SettingsRouter {
        return SettingsRouter(
            path: "/users/me",
            method: .get,
            encoding: URLEncoding.default
        )
    }

    static func updateUser() -> SettingsRouter {
        return SettingsRouter(
            path: "/users",
            method: .put,
            encoding: URLEncoding.default
        )
    }
}
