//
//  UIViewController+Extensions.swift
//  iOS-TvShows
//
//  Created by Filip Ban on 09.11.2021..
//

import UIKit

extension UIViewController {

    var leftBarButton: UIBarButtonItem? {
        navigationItem.leftBarButtonItem
    }

    var rightBarButton: UIBarButtonItem? {
        navigationItem.rightBarButtonItem
    }

    func hideNavigationBar() {
        navigationController?.setNavigationBarHidden(true, animated: true)
    }

    func showNavigationBar(leftOptionImage: UIImage? = nil) {
        navigationController?.setNavigationBarHidden(false, animated: true)
        navigationController?.navigationBar.barTintColor = .appWhite
        navigationController?.navigationBar.removeBottomBorder()

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

