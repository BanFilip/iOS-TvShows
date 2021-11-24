//
//  ShowDetailsWireframe.swift
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

final class ShowDetailsWireframe: BaseWireframe<ShowDetailsViewController> {

    // MARK: - Private properties -

    // MARK: - Module setup -

    init(with model: Show) {
        let moduleViewController = ShowDetailsViewController()
        moduleViewController.title = model.title
        super.init(viewController: moduleViewController)

        let interactor = ShowDetailsInteractor()
        let presenter = ShowDetailsPresenter(view: moduleViewController, interactor: interactor, wireframe: self)
        moduleViewController.presenter = presenter
    }

}

// MARK: - Extensions -

extension ShowDetailsWireframe: ShowDetailsWireframeInterface {
}