//
//  AuthStorage.swift
//  iOS-TvShows
//
//  Created by Filip Ban on 08.11.2021..
//

import Foundation
import KeychainAccess

final class AuthStorage {

    static let instance: AuthStorageInterface = AuthStorage()

    private let keychain = Keychain(service: Constants.Keychain.serviceName)
}

extension AuthStorage: AuthStorageInterface {

    func fetchAuthInfo() -> AuthInfo? {
        guard
            let data = try? keychain.getData(Constants.Keychain.Keys.authInfo),
            let item = try? JSONDecoder().decode(AuthInfo.self, from: data)
        else {
            return nil
        }
        return item
    }

    func storeAuthInfo(_ authInfo: AuthInfo?) {
        guard let authInfo = authInfo else {
            try? keychain.remove(Constants.Keychain.Keys.authInfo)
            return
        }

        guard let data = try? JSONEncoder().encode(authInfo) else { return }
        try? keychain.set(data, key: Constants.Keychain.Keys.authInfo)
    }

    func deleteAuthInfo() {
        try? keychain.remove(Constants.Keychain.Keys.authInfo)
    }
}

