//
//  BaseButton+Design.swift
//  iOS-TvShows
//
//  Created by Filip Ban on 10.11.2021..
//

import UIKit

extension BaseButton: ConstructViewsProtocol {

    func buildViews() {
        createViews()
        styleViews()
        defineLayoutForViews()
    }

    func createViews() {
    }

    func styleViews() {
        roundAllCorners(withRadius: 24)
        styleEnabled()
    }

    func defineLayoutForViews() {
        snp.makeConstraints {
            $0.height.equalTo(defaultHeight)
        }
    }
}
