//
//  ShowDetailsInterfaces.swift
//  iOS-TvShows
//
//  Created by Filip Ban on 24.11.2021..
//  Copyright (c) 2021 ___ORGANIZATIONNAME___. All rights reserved.
//
//  This file was generated by the 🐍 VIPER generator
//

import UIKit
import RxSwift
import RxCocoa

protocol ShowDetailsWireframeInterface: WireframeInterface {
}

protocol ShowDetailsViewInterface: ViewInterface {
}

protocol ShowDetailsPresenterInterface: PresenterInterface {
    func configure(with output: ShowDetails.ViewOutput) -> ShowDetails.ViewInput
}

protocol ShowDetailsInteractorInterface: InteractorInterface {
}

enum ShowDetails {

    struct ViewOutput {
    }

    struct ViewInput {
    }

}