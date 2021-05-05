//
//  InitialPresenter.swift
//  yumemi-ios
//
//  Created by kou yamamoto on 2021/05/05.
//

import Foundation

protocol InitialPresenterType: PresenterBase {
    func transitionToWeatherViewController()

}

final class InitialPresenter {

    // MARK: Dependency
    typealias Dependency = Dpendencies
    struct Dpendencies {
        let view: InitialView
    }

    private weak var view: InitialView?

}

extension InitialPresenter: PresenterInstantiable {

    func inject(with dependency: Dpendencies) -> Self {
        self.view = dependency.view
        return self
    }
}

extension InitialPresenter: InitialPresenterType {
    func transitionToWeatherViewController() {
        self.view?.transitionToWeahterViewController()
    }
}
