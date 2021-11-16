//
//  AuthStorageInterface.swift
//  iOS-TvShows
//
//  Created by Filip Ban on 08.11.2021..
//

import Foundation
import Alamofire

protocol AuthStorageInterface {
    func fetchAuthInfo() -> AuthInfo?
    func storeAuthInfo(_ model: AuthInfo?)
    func deleteAuthInfo()
}

