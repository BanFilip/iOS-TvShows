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

    func showNavigationBar(leftOptionImage: UIImage? = nil) {
        setNavigationBarHidden(false, animated: true)
        navigationBar.barTintColor = UIColor.TVShows.appWhite
        navigationBar.removeBottomBorder()

        if let leftOptionImage = leftOptionImage {
            let leftButton = UIBarButtonItem(
                image: leftOptionImage,
                style: .plain,
                target: nil,
                action: nil)
            navigationItem.setLeftBarButton(leftButton, animated: false)
        }
    }
}

