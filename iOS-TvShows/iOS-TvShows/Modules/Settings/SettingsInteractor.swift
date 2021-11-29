//
//  SettingsInteractor.swift
//  iOS-TvShows
//
//  Created by Filip Ban on 23.11.2021..
//  Copyright (c) 2021 ___ORGANIZATIONNAME___. All rights reserved.
//
//  This file was generated by the 🐍 VIPER generator
//

import Foundation
import RxSwift
import Alamofire

final class SettingsInteractor {

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

extension SettingsInteractor: SettingsInteractorInterface {

    var user: Single<User> {
        service.rx
            .request(
                UserResponse.self,
                router: SettingsRouter.user,
                session: sessionManager.session
            )
            .map { $0.user }
    }

    func updateUser(with image: UIImage) -> Single<User> {
        guard let imageData = image.jpegData(compressionQuality: 0.7) else {
            return .error(NSError())
        }
        let requestData = MultipartFormData()
        requestData.append(
            imageData,
            withName: "image",
            fileName: "image.jpg",
            mimeType: "image/jpg"
        )
        return service.rx
            .requestUpload(
                UserResponse.self,
                router: SettingsRouter.updateUser(),
                session: sessionManager.session,
                multipartFormData: requestData
            )
            .map { $0.user }
    }

    func deleteAuthInfo() {
        authStorage
            .deleteAuthInfo()
    }
}
