//
//  BaseButton.swift
//  iOS-TvShows
//
//  Created by Filip Ban on 10.11.2021..
//

import UIKit

class BaseButton: UIButton {

    let defaultHeight: CGFloat = 48

    override var isEnabled: Bool {
        didSet {
            isEnabled ? styleEnabled() : styleDisabled()
            isUserInteractionEnabled = isEnabled
        }
    }

    init() {
        super.init(frame: .zero)

        buildViews()
    }

    required public init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func styleEnabled() {
    }

    func styleDisabled() {
    }
}


