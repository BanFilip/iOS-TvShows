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

    static func updateUser(with data: Data) -> SettingsRouter {
        let dict = encodeData(data: data)
        return SettingsRouter(
            path: "/users",
            method: .put,
            encodableParams: EncodableParams(parameters: dict)
        )
    }

    static func encodeData(data: Data) -> [String: Any] {
        guard
            let data = try? JSONEncoder().encode(data),
            let json = try? JSONSerialization.jsonObject(with: data),
            let dict = json as? [String: Any]
        else {
            return [:]
        }
        return dict
    }
}

