//
//  WeatherPresenterTest.swift
//  yumemi-iosTests
//
//  Created by kou yamamoto on 2021/05/09.
//

import XCTest
@testable import yumemi_ios

class WeatherPresenterTests: XCTestCase {

    private var view: WeatherView!
    private var presenter: WeatherPresenterType!
    private var model: WeatherModelType!

    override func setUp() {
        self.view = WeatherMockView()
        self.model = WeatherMockModel()
        self.presenter = WeatherPresenter().inject(with: WeatherPresenter.Dependency(view: self.view, model: self.model))
    }

    func testSunnyWeather() {
        self.model.fetchWeather(parameters: ["":""]) { (weatherResult) in
            switch weatherResult {
            case .success(let weatherEntity):
                XCTAssertEqual(weatherEntity.weather, "sunny")
                self.view.changeWeatherImageView(weather: weatherEntity.weather)
            case .failure:
                break
            }
        }
    }

    func testSunnyWeahterView() {
        self.view.changeWeatherImageView(weather: "sunny")
    }
}

// WeahterModelのモック
final class WeatherMockModel: WeatherModelType {

    let weatherEntity = WeatherEntity(weather: "sunny", max_temp: 100, min_temp: 0, date: "2020-04-01T12:00:00+09:00")

    // sunnyだけを返すモック
    func fetchWeather(parameters: [String : String], completion: @escaping WeatherResult) {
        completion(.success(weatherEntity))
    }
}

// WeatherViewのモック
final class WeatherMockView: WeatherView {
    func showAlert(errorType: String, errorMessage: String) {
    }

    func showToast(message: String) {
    }

    func beginActivityIndicator() {
    }

    func endActivityIndicator() {
    }

    func changeWeatherImageView(weather: String) {
        XCTAssertEqual(weather, "sunny")
    }

    func changeTemperatureLabel(maxTemp: Int, minTemp: Int) {
    }
}
