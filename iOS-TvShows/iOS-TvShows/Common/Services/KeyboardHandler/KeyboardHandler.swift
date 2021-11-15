//
//  KeyboardHandler.swift
//  iOS-TvShows
//
//  Created by Filip Ban on 15.11.2021..
//

import UIKit
import RxSwift
import RxCocoa

public class KeyboardHandler {

    private init() {}

    public struct PresentingParams {
        let keyboardSize: CGSize
        let animationDuration: Double
        let state: State

        enum State {
            case show
            case hide
        }
    }

    public enum Insets {
        case forShown(inset: CGFloat)
        case forHidden(inset: CGFloat)
        case always(inset: CGFloat)
        case automatic
        case never
    }

}

public extension KeyboardHandler {

    static func register(
        handler: @escaping (_ params: PresentingParams) -> Void
    ) -> Disposable {
        return keyboardPresenting
            .observe(on: MainScheduler.instance)
            .subscribe(onNext: { handler($0) })
    }

    static func register(
        animatedHandler: @escaping (_ params: PresentingParams) -> Void
    ) -> Disposable {
        return KeyboardHandler
            .register(handler: { (params) in
                UIView.animate(withDuration: params.animationDuration) {
                    animatedHandler(params)
                }
            })
    }

}

public extension KeyboardHandler {

    static func register(
        scrollView: UIScrollView,
        additionalInsets: Insets = .never
    ) -> Disposable {
        return KeyboardHandler
            .register(handler: {
                let height = additionalInsets.add(to: $0.keyboardSize.height, with: $0.state)
                scrollView.contentInset.bottom = height
                scrollView.scrollIndicatorInsets.bottom = height
            })
    }

    static func register(
        constraint: NSLayoutConstraint,
        additionalInsets: Insets = .never,
        aditionalAnimationBlock: (() -> Void)? = nil
    ) -> Disposable {
        return KeyboardHandler
            .register(animatedHandler: {
                let height = additionalInsets.add(to: $0.keyboardSize.height, with: $0.state)
                constraint.constant = height
                aditionalAnimationBlock?()
            })
    }

}

public extension KeyboardHandler {

    static private(set) var keyboardPresenting: Observable<PresentingParams> = {
        let center = NotificationCenter.default

        let show = center.rx
            .notification(UIResponder.keyboardWillShowNotification)
            .map { PresentingParams(state: .show, notification: $0) }

        let hide = center.rx
            .notification(UIResponder.keyboardWillHideNotification)
            .map { PresentingParams(state: .hide, notification: $0) }

        return Observable.merge([show, hide])
            .share(replay: 1, scope: .forever)
            .compactMap { $0 }
    }()

}

private extension KeyboardHandler.Insets {

    func add(
        to value: CGFloat,
        with state: KeyboardHandler.PresentingParams.State
    ) -> CGFloat {
        switch (self, state) {
        case (.always(let inset), _):
            return value + inset
        case (.forShown(let inset), .show):
            return value + inset
        case (.forHidden(let inset), .hide):
            return value + inset
        case (.automatic, .show):
            return value - UIView().safeAreaInsets.bottom
        default:
            return value
        }
    }

}

private extension KeyboardHandler.PresentingParams {

    init?(state: State, notification: Notification) {
        guard
            let animationDuration = notification
                .userInfo?[UIResponder.keyboardAnimationDurationUserInfoKey] as? Double
        else { return nil }

        self.keyboardSize = KeyboardHandler.PresentingParams._size(for: state, from: notification)
        self.state = state
        self.animationDuration = animationDuration
    }

    private static func _size(
        for state: State,
        from notification: Notification
    ) -> CGSize {
        guard state != .hide else {
            return .zero
        }

        guard
            let rect = (
                notification
                    .userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?
                .cgRectValue
        else {
            return .zero
        }
        return rect.size
    }

}
