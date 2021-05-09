//
//  WeatherMockPresenter.swift
//  yumemi-iosTests
//
//  Created by kou yamamoto on 2021/05/09.
//

import Foundation
@testable import yumemi_ios

final class WeatherMockPresenter {

    private weak var view: WeatherView!
    private var model: WeatherMockModelProtocol!

    typealias Dependency = Dependencies
    struct Dependencies {
        let view: WeatherView
        let model: WeatherMockModelProtocol
    }

    func fetchWeather(weatherType: String) -> String {
        let result = self.model.fetchWeahter(weatherType: weatherType)
        return result
    }

    func fetchTemperature(temperature: String) -> String {
        let result = self.model.fetchTemperature(temperature: temperature)
        return result
    }
}

extension WeatherMockPresenter: PresenterInstantiable {
    func inject(with dependency: Dependencies) -> Self {
        self.view = dependency.view
        self.model = dependency.model
        return self
    }
}
