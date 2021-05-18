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
        let model: WeatherModelType
    }

    private weak var view: WeatherView?
    private var model: WeatherModelType?
    
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
        self.view?.beginActivityIndicator()
        self.model?.fetchWeather(parameters: parameters) { [weak self] (weatherResult) in
            DispatchQueue.main.async {
                self?.view?.endActivityIndicator()
                switch weatherResult {
                case .success(let weatherEntity):
                    self?.view?.changeWeatherImageView(weather: weatherEntity.weather)
                    self?.view?.changeTemperatureLabel(maxTemp: weatherEntity.max_temp, minTemp: weatherEntity.min_temp)
                case .failure:
                    self?.view?.showAlert(errorType: "エラー", errorMessage: "データの取得に失敗しました")
                }
            }
        }
    }
}

