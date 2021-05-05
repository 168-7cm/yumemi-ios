//
//  InitialViewController.swift
//  yumemi-ios
//
//  Created by kou yamamoto on 2021/05/05.
//

import Foundation

protocol InitialView: ViewBase {
    func transitionToWeahterViewController()
}

final class InitialViewController: ViewControllerBase {

    typealias Dependency = Dependencies
    struct Dependencies {
        let presenter: InitialPresenter
    }

    private var presenter: InitialPresenter?

    override func viewDidAppear(_ animated: Bool) {
        self.presenter?.transitionToWeatherViewController()
    }
}

extension InitialViewController: ViewControllerInstantiable {
    
    static func instansiate() -> InitialViewController {
        return R.storyboard.initial.initial()!
    }

    func inject(with dependency: Dependencies) {
        self.presenter = dependency.presenter
    }
}

extension InitialViewController: InitialView {
    func transitionToWeahterViewController() {
        let viewController = WeatherViewController.instansiate()
        let presenter = WeatherPresenter().inject(with: WeatherPresenter.Dependency(view: viewController, model: WeatherModel()))
        viewController.inject(with: WeatherViewController.Dependency(presenter: presenter))
        viewController.modalPresentationStyle = .fullScreen
        self.present(viewController, animated: true, completion: nil)
    }
}
