//
//  UIViewController+Extensions.swift
//  iOS-TvShows
//
//  Created by Filip Ban on 09.11.2021..
//

import UIKit

extension UINavigationController {
    var leftBarButton: UIBarButtonItem? {
        navigationItem.leftBarButtonItem
    }

    var rightBarButton: UIBarButtonItem? {
        navigationItem.rightBarButtonItem
    }

    func hideNavigationBar(_ animated: Bool) {
        setNavigationBarHidden(true, animated: animated)
    }

    func styleNavBar(prefersLargeTitles: Bool) {
        navigationBar.prefersLargeTitles = prefersLargeTitles
        navigationBar.isTranslucent = false
        navigationBar.barTintColor = .clear
        navigationBar.backgroundColor = UIColor.TVShows.appGrey

        if #available(iOS 13.0, *) {
            let navBarAppearance = UINavigationBarAppearance()
            navBarAppearance.configureWithTransparentBackground()
            navBarAppearance.largeTitleTextAttributes = [.foregroundColor: UIColor.black]
            navBarAppearance.backgroundColor = UIColor.TVShows.appGrey
            navigationBar.standardAppearance = navBarAppearance
            navigationBar.scrollEdgeAppearance = navBarAppearance
            navigationBar.removeBottomBorder()
        }
    }
}

