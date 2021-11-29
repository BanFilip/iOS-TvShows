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

    func requestResponse(
            router: Routable,
            session: Session
        ) -> Single<AFDataResponse<Data?>> {
            return Single<AFDataResponse<Data?>> .create { [weak base] single -> Disposable in
                let request = base?.requestResponse(
                    router: router,
                    session: session,
                    completion: { response in
                        if let error = response.error {
                            return single(.failure(error))
                        }
                        return single(.success(response))
                    }
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

    func requestUpload<T: Decodable>(
        _: T.Type,
        keyPath: String? = nil,
        decoder: JSONDecoder = JSONDecoder(),
        router: Routable,
        session: Session,
        multipartFormData: MultipartFormData
    ) -> Single<T> {
        return Single<T>.create { [weak base] single -> Disposable in
            let request = base?.requestUpload(
                T.self,
                keyPath: keyPath,
                decoder: decoder,
                router: router,
                session: session,
                multipartFormData: multipartFormData,
                completion: { single($0.toSingleEvent) }
            )

            return Disposables.create { request?.cancel() }
        }
    }

}
