//
//  ShowsInterfaces.swift
//  iOS-TvShows
//
//  Created by Filip Ban on 23.11.2021..
//  Copyright (c) 2021 ___ORGANIZATIONNAME___. All rights reserved.
//
//  This file was generated by the 🐍 VIPER generator
//

import UIKit
import RxSwift
import RxCocoa

protocol ShowsWireframeInterface: WireframeInterface {
    func goToSettings()
}

protocol ShowsViewInterface: ViewInterface {
}

protocol ShowsPresenterInterface: PresenterInterface {
    func configure(with output: Shows.ViewOutput) -> Shows.ViewInput
}

protocol ShowsInteractorInterface: InteractorInterface {
}

enum Shows {

    struct ViewOutput {
        let settings: Signal<Void>
    }

    struct ViewInput {
    }

}