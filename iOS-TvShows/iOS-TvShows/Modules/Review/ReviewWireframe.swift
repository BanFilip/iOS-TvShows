//
//  ReviewWireframe.swift
//  iOS-TvShows
//
//  Created by Filip Ban on 30.11.2021..
//  Copyright (c) 2021 ___ORGANIZATIONNAME___. All rights reserved.
//
//  This file was generated by the 🐍 VIPER generator
//

import UIKit
import RxSwift
import RxCocoa

final class ReviewWireframe: BaseWireframe<ReviewViewController> {

    // MARK: - Private properties -

    // MARK: - Module setup -

    init(with id: String) {
        let moduleViewController = ReviewViewController()
        super.init(viewController: moduleViewController)

        let interactor = ReviewInteractor(identifier: id)
        let presenter = ReviewPresenter(view: moduleViewController, interactor: interactor, wireframe: self)
        moduleViewController.presenter = presenter
    }

}

// MARK: - Extensions -

extension ReviewWireframe: ReviewWireframeInterface {
    func dismiss() {
        navigationController?.dismiss(animated: true, completion: nil)
    }
}
