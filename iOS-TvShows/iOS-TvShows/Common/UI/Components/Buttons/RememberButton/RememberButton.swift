//
//  RememberButton.swift
//  iOS-TvShows
//
//  Created by Filip Ban on 10.11.2021..
//

import UIKit

class RememberButton: UIButton {

    override var isSelected: Bool {
        didSet {
            let bundleImage: BundleImage = isSelected ? .checkboxSelected : .checkboxUnselected
            setImage(UIImage(with: bundleImage), for: .normal)
        }
    }

    init() {
        super.init(frame: .zero)
        styleViews()
    }

    required public init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
