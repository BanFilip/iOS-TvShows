//
//  AppKeyboardService.swift
//  iOS-TvShows
//
//  Created by Filip Ban on 10.11.2021..
//

import UIKit

final class AppKeyboardService: AppKeyboardServiceInterface {

    static let instance: AppKeyboardServiceInterface = AppKeyboardService()

    private var subscribers: [String: KeyboardSubscriberInterface] = [:]

    func subscribe(subscriber: KeyboardSubscriberInterface) {
        let id = subscriber.id

        subscribers[id] = subscriber

        if subscribers.count == 1 {
            addKeyboardObserver()
        }
    }

    func unsubscribe(subscriber: KeyboardSubscriberInterface) {
        let id = subscriber.id
        subscribers.removeValue(forKey: id)

        if subscribers.count == 0 {
            NotificationCenter.default.removeObserver(self)
        }
    }

    private func addKeyboardObserver() {
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(self.onKeyboardFrameChanged(notification:)),
            name: UIResponder.keyboardWillChangeFrameNotification,
            object: nil)
    }

    @objc
    private func onKeyboardFrameChanged(notification: NSNotification) {
        guard
            let userInfo = notification.userInfo,
            let endFrame = (userInfo[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue,
            let window = UIApplication.shared.windows.filter({ $0.isKeyWindow }).first
        else {
            return
        }

        let endFrameY = endFrame.origin.y
        let defaultKeyboardAnimation = (userInfo[UIResponder.keyboardAnimationDurationUserInfoKey] as? NSNumber)
        let animationDuration: TimeInterval = defaultKeyboardAnimation?.doubleValue ?? 0
        let bottomSafeAreaPadding: CGFloat = window.safeAreaInsets.bottom

        for subscriber in Array(subscribers.values) {
            subscriber.onKeyboardFrameChanged(
                endFrame: endFrame,
                endFrameY: endFrameY,
                animationDuration: animationDuration,
                bottomPadding: bottomSafeAreaPadding)
        }
    }
}

