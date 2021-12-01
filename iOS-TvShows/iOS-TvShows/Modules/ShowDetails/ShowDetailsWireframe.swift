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

    private let identifier: String

    // MARK: - Module setup -

    init(with id: String) {
        let moduleViewController = ShowDetailsViewController()
        identifier = id
        super.init(viewController: moduleViewController)

        let interactor = ShowDetailsInteractor(identifier: id)
        let presenter = ShowDetailsPresenter(view: moduleViewController, interactor: interactor, wireframe: self)
        moduleViewController.presenter = presenter
    }

}

// MARK: - Extensions -

extension ShowDetailsWireframe: ShowDetailsWireframeInterface {

    func goToSubmitReview() {
        navigationController?.present(
            UINavigationController(rootViewController: ReviewWireframe(with: identifier).viewController),
            animated: true,
            completion: nil
        )
    }
}
