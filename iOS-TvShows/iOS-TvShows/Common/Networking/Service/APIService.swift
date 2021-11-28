//
//  APIService.swift
//
//  Created by Filip Gulan on 24/03/2019.
//  Copyright © 2019 Infinum. All rights reserved.
//

import Foundation
import Alamofire

/// Base protocol for API networking communication.
public protocol APIServiceable: AnyObject {

    @discardableResult
    func request<T: Decodable>(
        _: T.Type,
        keyPath: String?,
        decoder: JSONDecoder,
        router: Routable,
        session: Session,
        completion: @escaping (AFResult<T>) -> Void
    ) -> DataRequest

    @discardableResult
    func requestResponse(
        router: Routable,
        session: Session,
        completion: @escaping (AFDataResponse<Data?>) -> Void
    ) -> DataRequest

    @discardableResult
    func requestCompletion(
        router: Routable,
        session: Session,
        completion: @escaping (AFResult<Void>) -> Void
    ) -> DataRequest

    @discardableResult
    func requestUpload<T: Decodable>(
        _: T.Type,
        keyPath: String?,
        decoder: JSONDecoder,
        router: Routable,
        session: Session,
        multipartFormData: MultipartFormData,
        completion: @escaping (AFResult<T>) -> Void
    ) -> DataRequest

}

public extension APIServiceable {

    /// Creates data request from router and validates it
    /// - Parameters:
    ///   - router: Routable item
    ///   - session: Current session
    func prepareRequest(for router: Routable, session: Session) -> DataRequest {
        return session.request(router).validate()
    }

    func prepareUpload(
        session: Session,
        multipartFormData: MultipartFormData,
        url: String,
        method: HTTPMethod
    ) -> DataRequest {
        return session.upload(
            multipartFormData: multipartFormData,
            to: url, method: method
        ).validate()
    }

}

/// Base API service class containing shared logic for all API calls
open class APIService: APIServiceable {

    public static var instance = APIService()

    @discardableResult
    open func request<T: Decodable>(
        _: T.Type,
        keyPath: String? = nil,
        decoder: JSONDecoder = JSONDecoder(),
        router: Routable,
        session: Session,
        completion: @escaping (AFResult<T>) -> Void
    ) -> DataRequest {
        return prepareRequest(for: router, session: session)
            .responseDecodable(keyPath: keyPath, decoder: decoder) { completion($0.result) }
    }

    @discardableResult
    open func requestResponse(
        router: Routable,
        session: Session,
        completion: @escaping (AFDataResponse<Data?>) -> Void
    ) -> DataRequest {
        return prepareRequest(for: router, session: session)
            .response { completion($0) }
    }

    @discardableResult
    open func requestCompletion(
        router: Routable,
        session: Session,
        completion: @escaping (AFResult<Void>) -> Void
    ) -> DataRequest {
        return prepareRequest(for: router, session: session)
            .response { completion($0.result.mapToVoid) }
    }

    @discardableResult
    open func requestUpload<T: Decodable>(
        _: T.Type,
        keyPath: String? = nil,
        decoder: JSONDecoder = JSONDecoder(),
        router: Routable,
        session: Session,
        multipartFormData: MultipartFormData,
        completion: @escaping (AFResult<T>) -> Void
    ) -> DataRequest {
        return prepareUpload(
            session: session,
            multipartFormData: multipartFormData,
            url: router.baseUrl + router.path,
            method: router.method
        )
        .responseDecodable(keyPath: keyPath, decoder: decoder) { completion($0.result) }
    }
}

///
/// NB: If you don't use Rx in your project, just remove `ReactiveCompatible`
/// protocol conformance
import RxSwift

extension APIService: ReactiveCompatible { }
