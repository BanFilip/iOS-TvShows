//
//  AuthAdapter.swift
//  iOS-TvShows
//
//  Created by Filip Ban on 08.11.2021..
//

import Foundation
import Alamofire

public struct AuthAdapter: RequestInterceptor {

    private let authInfo: AuthInfo

    init(with authInfo: AuthInfo) {
        self.authInfo = authInfo
    }

    public func adapt(
        _ urlRequest: URLRequest,
        for session: Session,
        completion: @escaping (Result<URLRequest, Error>) -> Void
    ) {
        let urlRequest = urlRequest.setHeaderValues(with: authInfo)
        completion(.success(urlRequest))
    }
}
