//
//  AppKeyboardServiceInterface.swift
//  iOS-TvShows
//
//  Created by Filip Ban on 10.11.2021..
//

protocol AppKeyboardServiceInterface: AnyObject {

    func subscribe(subscriber: KeyboardSubscriberInterface)
    func unsubscribe(subscriber: KeyboardSubscriberInterface)
}
