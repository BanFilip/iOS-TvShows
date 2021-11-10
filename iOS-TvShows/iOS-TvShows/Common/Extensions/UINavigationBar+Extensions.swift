//
//  UINavigationBar+Extensions.swift
//  iOS-TvShows
//
//  Created by Filip Ban on 09.11.2021..
//

import UIKit

extension UINavigationBar {

    func removeBottomBorder() {
        setBackgroundImage(UIImage(), for: .default)
        shadowImage = UIImage()
        layoutIfNeeded()
    }
}
