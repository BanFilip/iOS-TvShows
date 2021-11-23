//
//  HomeViewController.swift
//  iOS-TvShows
//
//  Created by Filip Ban on 16.11.2021..
//  Copyright (c) 2021 ___ORGANIZATIONNAME___. All rights reserved.
//
//  This file was generated by the 🐍 VIPER generator
//

import UIKit
import RxSwift
import RxCocoa

final class HomeTabBarController: UITabBarController {

    // MARK: - Public properties -

    // MARK: - Private properties -

    private let disposeBag = DisposeBag()

    // MARK: - Lifecycle -

    convenience init(viewControllers: [UIViewController]) {
        self.init()

        self.viewControllers = viewControllers
        setTabBarItems(with: viewControllers)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.hideNavigationBar(animated)
    }
}

// MARK: - Extensions -

private extension HomeTabBarController {

    private func setTabBarItems(with viewControllers: [UIViewController]) {
        zip(TabBarItemType.allCases, viewControllers).forEach { type, controller in
            let components = makeComponents(for: type)
            let tabBarItem = UITabBarItem(
                title: components.title,
                image: components.image.withRenderingMode(.alwaysOriginal),
                selectedImage: components.image.withRenderingMode(.alwaysTemplate))
            controller.tabBarItem = tabBarItem
        }
    }

    private func makeComponents(for type: TabBarItemType) -> (image: UIImage, title: String) {
        switch type {
        case .shows:
            return (image: UIImage.TVShows.Icons.shows, title: "Shows")
        case .topRated:
            return (image: UIImage.TVShows.Icons.topRated, title: "Top Rated")
        }
    }
}
