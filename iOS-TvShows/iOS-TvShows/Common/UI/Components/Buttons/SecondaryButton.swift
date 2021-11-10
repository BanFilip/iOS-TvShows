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
        titleLabel?.font = .button1
    }

    required public init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func styleEnabled() {
        backgroundColor = .appWhite
        setTitleColor(.appPurple, for: .normal)
    }

    override func styleDisabled() {
        backgroundColor = .appWhite.withAlphaComponent(0.3)
        setTitleColor(.appWhite.withAlphaComponent(0.4), for: .normal)
    }
}
