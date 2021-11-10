//
//  BaseTextField+Design.swift
//  iOS-TvShows
//
//  Created by Filip Ban on 10.11.2021..
//

import UIKit
import SnapKit

extension BaseTextField: ConstructViewsProtocol {

    func buildViews() {
        styleViews()
        defineLayoutForViews()
    }

    func createViews() {
    }

    func styleViews() {
        textColor = .appWhite
        font = .body1
    }

    func defineLayoutForViews() {
        snp.makeConstraints {
            $0.height.equalTo(defaultHeight)
        }
    }

}
