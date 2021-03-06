//
//  LoginInterfaces.swift
//  iOS-TvShows
//
//  Created by Filip Ban on 08.11.2021..
//  Copyright (c) 2021 ___ORGANIZATIONNAME___. All rights reserved.
//
//  This file was generated by the 🐍 VIPER generator
//

import UIKit
import RxSwift
import RxCocoa

protocol LoginWireframeInterface: WireframeInterface {
    func goToHome()
}

protocol LoginViewInterface: ViewInterface, Progressable {
}

protocol LoginPresenterInterface: PresenterInterface {
    func configure(with output: Login.ViewOutput) -> Login.ViewInput
}

protocol LoginInteractorInterface: InteractorInterface {
    func login(email: String, password: String, shouldRemember: Bool) -> Single<Void>
    func register(email: String, password: String, shouldRemember: Bool) -> Single<Void>
}

enum Login {

    struct ViewOutput {
        let email: Driver<String?>
        let password: Driver<String?>
        let shouldRemember: Driver<Bool>
        let login: Signal<Void>
        let register: Signal<Void>
    }

    struct ViewInput {
        let areButtonsEnabled: Driver<Bool>
        let isEmailValid: Driver<Bool>
        let isPasswordValid: Driver<Bool>
    }
}
