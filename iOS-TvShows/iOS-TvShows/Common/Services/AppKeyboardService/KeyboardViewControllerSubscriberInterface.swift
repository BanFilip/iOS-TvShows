//
//  KeyboardViewController.swift
//  iOS-TvShows
//
//  Created by Filip Ban on 10.11.2021..
//

import UIKit
import SnapKit

protocol KeyboardViewControllerSubscriberInterface: KeyboardSubscriberInterface {
    var bottomConstraint: Constraint? { get }
}

extension KeyboardViewControllerSubscriberInterface where Self: UIViewController {

    var id: String {
        UUID().uuidString
    }

    func onKeyboardFrameChanged(
        endFrame: CGRect,
        endFrameY: CGFloat,
        animationDuration: Double,
        bottomPadding: CGFloat
    ) {
        if endFrameY >= UIScreen.main.bounds.size.height {
            bottomConstraint?.update(offset: 0)
        } else {
            let frameHeight = endFrame.size.height
            bottomConstraint?.update(offset: bottomPadding - frameHeight)
        }

        UIView.animate(withDuration: animationDuration) { [weak self] in
            self?.view.layoutIfNeeded()
        }
    }
}

