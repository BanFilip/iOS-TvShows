//
//  AppDelegate.swift
//  iOS-TvShows
//
//  Created by Filip Ban on 08.11.2021..
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        let rootNavigationController = UINavigationController()

        window = UIWindow(frame: UIScreen.main.bounds)
        guard let window = window else {
            return false
        }

        rootNavigationController.setRootWireframe(LoginWireframe())
        window.rootViewController = rootNavigationController
        window.makeKeyAndVisible()
        return true
    }
}
