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
        UITabBar.appearance().tintColor = UIColor.TVShows.appPurple
        UINavigationBar.appearance().tintColor = UIColor.TVShows.appPurple

        window = UIWindow(frame: UIScreen.main.bounds)
        guard let window = window else {
            return false
        }

        rootNavigationController.setRootWireframe(HomeWireframe())
        window.rootViewController = rootNavigationController
        window.makeKeyAndVisible()
        return true
    }
}
