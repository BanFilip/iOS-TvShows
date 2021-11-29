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
        startApp()
        styleAppearances()

        return true
    }
}

private extension AppDelegate {

    func startApp() {
        let rootNavigationController = UINavigationController()
        if let authInfo = AuthStorage.instance.fetchAuthInfo() {
            SessionManager.default.authorizationAdapter = AuthAdapter(with: authInfo)
            rootNavigationController.setRootWireframe(HomeWireframe())
        } else {
            rootNavigationController.setRootWireframe(LoginWireframe())
        }
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = rootNavigationController
        window?.makeKeyAndVisible()
    }

    func styleAppearances() {
        UITabBar.appearance().tintColor = UIColor.TVShows.appPurple
        UITabBar.appearance().barTintColor = UIColor.TVShows.appGrey
        UINavigationBar.appearance().tintColor = UIColor.TVShows.appPurple
    }
}
