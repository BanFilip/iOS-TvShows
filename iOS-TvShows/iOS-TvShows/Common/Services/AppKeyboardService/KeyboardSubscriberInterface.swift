//
//  KeyboardSubscriberInterface.swift
//  iOS-TvShows
//
//  Created by Filip Ban on 10.11.2021..
//

import UIKit

protocol KeyboardSubscriberInterface {

    var id: String { get }

    func onKeyboardFrameChanged(
        endFrame: CGRect,
        endFrameY: CGFloat,
        animationDuration: Double,
        bottomPadding: CGFloat
    )
}
