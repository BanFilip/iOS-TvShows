//
//  SecondaryButton.swift
//  iOS-TvShows
//
//  Created by Filip Ban on 10.11.2021..
//

import UIKit

class SecondaryButton: BaseButton {

    override init() {
        super.init()
        titleLabel?.font = UIFont.systemFont(ofSize: 17, weight: .medium)
    }

    required public init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func styleEnabled() {
        backgroundColor = UIColor.TVShows.appWhite
        setTitleColor(UIColor.TVShows.appPurple, for: .normal)
    }

    override func styleDisabled() {
        backgroundColor = UIColor.TVShows.appWhite.withAlphaComponent(0.3)
        setTitleColor(UIColor.TVShows.appWhite.withAlphaComponent(0.4), for: .normal)
    }
}

