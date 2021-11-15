//
//  SeparatorView+Design.swift
//  iOS-TvShows
//
//  Created by Filip Ban on 10.11.2021..
//

import UIKit

extension SeparatorView: ConstructViewsProtocol {

    func buildViews() {
        styleViews()
        defineLayoutForViews()
    }

    func createViews() {
    }

    func styleViews() {
        backgroundColor = UIColor.TVShows.appWhite.withAlphaComponent(0.7)
    }

    func defineLayoutForViews() {
        snp.makeConstraints {
            $0.height.equalTo(defaultHeight)
        }
    }
}

