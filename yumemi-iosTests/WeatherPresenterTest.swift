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

    func testSunnyWeatherView() {
        self.presenter.fetchWeather(parameters: ["weather":"sunny","max_temp": 100, "min_temp": 0])
    }

    func testCloudyWeahterView() {
        self.presenter.fetchWeather(parameters: ["weather": "cloudy", "max_temp": 100, "min_temp": 0])
    }

    func testRainyWeatherView() {
        self.presenter.fetchWeather(parameters: ["weather": "rainy", "max_temp": 100, "min_temp": 0])
    }
}

// WeahterModelのモック
final class WeatherMockModel: WeatherModelType {

    //「weather」と「temp」を返すモック
    func fetchWeather(parameters: [String: Any], completion: @escaping WeatherResult) {
        let weather = parameters["weather"] as? String ?? ""
        let max_temp = parameters["max_temp"] as? Int ?? 0
        let min_temp = parameters["min_temp"] as? Int ?? 100
        let weatherEntity = WeatherEntity(weather: weather, max_temp: max_temp, min_temp: min_temp, date: "2020-04-01T12:00:00+09:00")
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
        switch weather {
        case "sunny":
            XCTAssertEqual(weather, "sunny")
        case "cloudy":
            XCTAssertEqual(weather, "cloudy")
        case "rainy":
            XCTAssertEqual(weather, "rainy")
        default:
            XCTFail()
        }
    }

    func changeTemperatureLabel(maxTemp: Int, minTemp: Int) {
        XCTAssertEqual(maxTemp, 100)
        XCTAssertEqual(minTemp, 0)
    }
}
