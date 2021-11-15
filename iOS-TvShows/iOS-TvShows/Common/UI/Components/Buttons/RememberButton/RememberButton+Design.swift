//
//  RememberButton+Design.swift
//  iOS-TvShows
//
//  Created by Filip Ban on 10.11.2021..
//

import UIKit

extension RememberButton: ConstructViewsProtocol {

    func buildViews() {
    }

    func createViews() {
    }

    func styleViews() {
        setTitleColor(.appWhite, for: .normal)
        titleLabel?.font = UIFont.systemFont(ofSize: 17)
        contentHorizontalAlignment = .leading
        titleEdgeInsets = UIEdgeInsets(top: 0, left: 8, bottom: 0, right: 0)
        isSelected = false
    }

    func defineLayoutForViews() {
    }
}
