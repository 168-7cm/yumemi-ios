//
//  WeatherPresenter.swift
//  yumemi-ios
//
//  Created by kou yamamoto on 2021/04/25.
//

import Foundation

protocol WeatherPresenterType: PresenterBase {
    func fetchWeather(parameters: [String: String])
}

final class WeatherPresenter {

    // MARK: Dependency
    typealias Dependency = Dpendencies
    struct Dpendencies {
        let view: WeatherView
        let model: WeatherModelInput
    }

    private weak var view: WeatherView?
    private var model: WeatherModelInput?
    
}

extension WeatherPresenter: PresenterInstantiable {

    func inject(with dependency: Dpendencies) -> Self {
        self.view = dependency.view
        self.model = dependency.model
        return self
    }
}

extension WeatherPresenter: WeatherPresenterType {
    
    func fetchWeather(parameters: [String: String]) {
        self.model?.fetchWeather(parameters: parameters) { (weatherEntity, error) in
            if let weatherEntity = weatherEntity {
                self.view?.changeWeatherImageView(weather: weatherEntity.weather)
                self.view?.changeTemperatureLabel(maxTemp: weatherEntity.max_temp, minTemp: weatherEntity.min_temp)
            } else {
                self.view?.showAlert(errorType: "エラー", errorMessage: "データの取得に失敗しました")
            }
        }
    }
}
