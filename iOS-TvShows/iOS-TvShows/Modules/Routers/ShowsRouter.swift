//
//  ShowsRouter.swift
//  iOS-TvShows
//
//  Created by Filip Ban on 24.11.2021..
//

import Foundation
import Alamofire

class ShowsRouter: Router {

    static var shows: ShowsRouter {
        return ShowsRouter(
            path: "/shows",
            method: .get,
            encoding: URLEncoding.default
        )
    }

    static var topRatedShows: ShowsRouter {
        return ShowsRouter(
            path: "/shows/top_rated",
            method: .get,
            encoding: URLEncoding.default
        )
    }

    static func show(with id: String) -> ShowsRouter {
        return ShowsRouter(
            path: "/shows/\(id)",
            method: .get,
            encoding: URLEncoding.default
        )
    }
}
