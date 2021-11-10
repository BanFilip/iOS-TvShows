//
//  KeyboardViewController.swift
//  iOS-TvShows
//
//  Created by Filip Ban on 10.11.2021..
//

import UIKit
import SnapKit

class KeyboardViewController: UIViewController, KeyboardSubscriberInterface {

    let id: String = UUID().uuidString

    var bottomConstraint: Constraint?

    weak var appKeyboardService = AppKeyboardService.instance

    convenience init(appKeyboardService: AppKeyboardServiceInterface) {
        self.init()
    }

    override func viewWillAppear(_ animated: Bool) {
        appKeyboardService?.subscribe(subscriber: self)
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

    deinit {
        appKeyboardService?.unsubscribe(subscriber: self)
    }
}

