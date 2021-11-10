//
//  UIView+Extensions.swift
//  iOS-TvShows
//
//  Created by Filip Ban on 09.11.2021..
//

import UIKit

extension UIView {

    func roundTopCorners(withRadius radius: CGFloat) {
        layer.cornerRadius = radius
        layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
    }

    func roundBottomCorners(withRadius radius: CGFloat) {
        layer.cornerRadius = radius
        layer.maskedCorners = [.layerMaxXMaxYCorner, .layerMinXMaxYCorner]
    }

    func roundAllCorners(withRadius radius: CGFloat) {
        layer.cornerRadius = radius
        layer.maskedCorners = [
            .layerMinXMinYCorner,
            .layerMaxXMinYCorner,
            .layerMaxXMaxYCorner,
            .layerMinXMaxYCorner]
    }
}
