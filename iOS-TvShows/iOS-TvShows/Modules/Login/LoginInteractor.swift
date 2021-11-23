//
//  LoginInteractor.swift
//  iOS-TvShows
//
//  Created by Filip Ban on 08.11.2021..
//  Copyright (c) 2021 ___ORGANIZATIONNAME___. All rights reserved.
//
//  This file was generated by the 🐍 VIPER generator
//

import Foundation
import RxSwift

final class LoginInteractor {

    private let service: APIService
    private let sessionManager: SessionManager
    private let authStorage: AuthStorageInterface

    init(
        service: APIService = APIService.instance,
        sessionManager: SessionManager = .default,
        authStorage: AuthStorageInterface = AuthStorage.instance
    ) {
        self.service = service
        self.sessionManager = sessionManager
        self.authStorage = authStorage
    }
}

// MARK: - Extensions -

extension LoginInteractor: LoginInteractorInterface {

    func login(email: String, password: String, shouldRemember: Bool) -> Single<Void> {
        handle(router: LoginRouter.login(email: email, password: password), shouldRemember)
    }

    func register(email: String, password: String, shouldRemember: Bool) -> Single<Void> {
        handle(router: LoginRouter.register(email: email, password: password), shouldRemember)
    }

    private func handle(router: Routable,_ shouldRemember: Bool) -> Single<Void> {
        service.rx
            .requestResponse(
                router: router,
                session: sessionManager.session
            )
            .do(onSuccess: { [weak self] response in
                guard
                    let self = self,
                    let response = response.response
                else {
                    return
                }

                let authInfo = AuthInfo(from: response)
                if shouldRemember {
                    self.authStorage.storeAuthInfo(authInfo)
                }
                self.sessionManager.authorizationAdapter = AuthAdapter(with: authInfo)
            })
            .map { _ in () }
    }
}
  
