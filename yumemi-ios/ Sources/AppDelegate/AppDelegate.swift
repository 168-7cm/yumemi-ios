//
//  AppDelegate.swift
//  yumemi-ios
//
//  Created by kou yamamoto on 2021/04/24.
//

import UIKit
import Firebase

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {

        // Firebase
        FirebaseApp.configure()

        let viewController = InitialViewController.instansiate()
        let presenter = InitialPresenter().inject(with: InitialPresenter.Dependency(view: viewController))
        viewController.inject(with: InitialViewController.Dependency(presenter: presenter))
        self.window?.rootViewController = viewController
        return true
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        NotificationCenter.default.post(name: .foreground, object: nil)
    }
}

