//
//  APIService+Rx.swift
//
//  Created by Filip Gulan on 24/03/2019.
//  Copyright © 2019 Infinum. All rights reserved.
//

import Foundation
import RxSwift
import Alamofire

public extension Reactive where Base: APIServiceable {

    func request<T: Decodable>(
        _: T.Type,
        keyPath: String? = nil,
        decoder: JSONDecoder = JSONDecoder(),
        router: Routable,
        session: Session
    ) -> Single<T> {
        return Single<T>.create { [weak base] single -> Disposable in
            let request = base?.request(
                T.self,
                keyPath: keyPath,
                decoder: decoder,
                router: router,
                session: session,
                completion: { single($0.toSingleEvent) }
            )
            return Disposables.create { request?.cancel() }
        }
    }

    func requestResponse<T: Decodable>(
        _: T.Type,
        keyPath: String? = nil,
        decoder: JSONDecoder = JSONDecoder(),
        router: Routable,
        session: Session
    ) -> Single<DataResponse<T, AFError>> {
        return Single<DataResponse<T, AFError>> .create { [weak base] single -> Disposable in
            let request = base?.requestResponse(
                T.self,
                keyPath: keyPath,
                decoder: decoder,
                router: router,
                session: session,
                completion: { single(.success($0)) }
                )
            return Disposables.create { request?.cancel() }
        }
    }

    func requestCompletion(
        router: Routable,
        session: Session
    ) -> Completable {
        return Completable.create { [weak base] completable -> Disposable in
            let request = base?.requestCompletion(
                router: router,
                session: session,
                completion: { completable($0.toCompletableEvent) }
            )
            return Disposables.create { request?.cancel() }
        }
    }

}
