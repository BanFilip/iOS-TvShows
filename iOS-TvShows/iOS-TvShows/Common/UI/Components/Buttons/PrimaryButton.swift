//
//  PrimaryButton.swift
//  iOS-TvShows
//
//  Created by Filip Ban on 10.11.2021..
//

import UIKit

class PrimaryButton: BaseButton {

    override init() {
        super.init()
        titleLabel?.font = UIFont.boldSystemFont(ofSize: 17)
    }

    required public init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func styleEnabled() {
        backgroundColor = UIColor.TVShows.appPurple
        setTitleColor(UIColor.TVShows.appWhite, for: .normal)
        alpha = .alphaEnabled
    }

    override func styleDisabled() {
        alpha = .alphaDisabled
    }
}
