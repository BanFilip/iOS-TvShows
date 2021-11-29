//
//  TopRatedInterfaces.swift
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

protocol TopRatedWireframeInterface: WireframeInterface {
    func goToSettings()
}

protocol TopRatedViewInterface: ViewInterface {
}

protocol TopRatedPresenterInterface: PresenterInterface {
    func configure(with output: TopRated.ViewOutput) -> TopRated.ViewInput
}

protocol TopRatedInteractorInterface: InteractorInterface {
}

enum TopRated {

    struct ViewOutput {
        let settings: Signal<Void>
    }

    struct ViewInput {
    }

}
