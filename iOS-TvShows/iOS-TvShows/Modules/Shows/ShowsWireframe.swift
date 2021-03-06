//
//  ShowsWireframe.swift
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

final class ShowsWireframe: BaseWireframe<ShowsViewController> {

    // MARK: - Private properties -

    // MARK: - Module setup -

    init() {
        let moduleViewController = ShowsViewController()
        super.init(viewController: moduleViewController)

        let interactor = ShowsInteractor()
        let presenter = ShowsPresenter(view: moduleViewController, interactor: interactor, wireframe: self)
        moduleViewController.presenter = presenter
    }

}

// MARK: - Extensions -

extension ShowsWireframe: ShowsWireframeInterface {
    func goToSettings() {
        navigationController?.present(
            UINavigationController(rootViewController: SettingsWireframe().viewController),
            animated: true,
            completion: nil
        )
    }

    func goToShowDetails(with id: String) {
        navigationController?.pushWireframe(ShowDetailsWireframe(with: id))
    }
}
