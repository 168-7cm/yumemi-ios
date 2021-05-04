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

        let viewController = WeatherViewController.instansiate()
        let presenter = WeatherPresenter().inject(with: WeatherPresenter.Dependency(view: viewController, model: WeatherModel()))
        viewController.inject(with: WeatherViewController.Dependency(presenter: presenter))
        self.window?.rootViewController = viewController
        return true
    }
}

