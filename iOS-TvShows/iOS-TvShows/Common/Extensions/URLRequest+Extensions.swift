//
//  URLRequest+Extensions.swift
//  iOS-TvShows
//
//  Created by Filip Ban on 09.11.2021..
//

import Foundation

extension URLRequest {

    func setHeaderValues(with authInfo: AuthInfo) -> URLRequest {
        var urlRequest = self
        urlRequest.setValue(Constants.RequestInterceptor.acceptFormat, forHTTPHeaderField: Constants.RequestInterceptor.accept)
        urlRequest.setValue(authInfo.accessToken, forHTTPHeaderField: Constants.RequestInterceptor.accessToken)
        urlRequest.setValue(authInfo.client, forHTTPHeaderField: Constants.RequestInterceptor.client)
        urlRequest.setValue(authInfo.expiry, forHTTPHeaderField: Constants.RequestInterceptor.expiry)
        urlRequest.setValue(authInfo.tokenType, forHTTPHeaderField: Constants.RequestInterceptor.tokenType)
        urlRequest.setValue(authInfo.uid, forHTTPHeaderField: Constants.RequestInterceptor.uid)

        return urlRequest
    }

}
