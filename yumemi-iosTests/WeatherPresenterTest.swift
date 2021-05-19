////
////  WeatherPresenterTest.swift
////  yumemi-iosTests
////
////  Created by kou yamamoto on 2021/05/09.
////
//
//import XCTest
//@testable import yumemi_ios
//
//class WeatherPresenterTests: XCTestCase {
//
//    private var view: WeatherView!
//    private var presenter: WeatherPresenterType!
//    private var model: WeatherModelType!
//
////    override func setUp() {
////        self.view = WeatherMockView(targetWeather: "sunny", max_temp: 100, min_temp: 0)
////        self.model = WeatherMockModel()
////        self.presenter = WeatherPresenter().inject(with: WeatherPresenter.Dependency(view: self.view, model: self.model))
////    }
//
//    func setup(targetWeather: String, max_temp: Int, min_temp: Int) {
//        self.view = WeatherMockView(targetWeather: targetWeather, max_temp: max_temp, min_temp: min_temp)
//        self.model = WeatherMockModel()
//        self.presenter = WeatherPresenter().inject(with: WeatherPresenter.Dependency(view: self.view, model: self.model))
//    }
//
//    func testSunnyWeatherView() {
//        self.setup(targetWeather: "sunny", max_temp: 100, min_temp: 0)
//        self.presenter.fetchWeather(parameters: ["weather":"sunny", "max_temp": "100", "min_temp": "0"])
//    }
//
//    func testCloudyWeahterView() {
//        self.setup(targetWeather: "cloudy", max_temp: 100, min_temp: 0)
//        self.presenter.fetchWeather(parameters: ["weather": "cloudy", "max_temp": "100", "min_temp": "0"])
//    }
//
//    func testRainyWeatherView() {
//        self.setup(targetWeather: "rainy", max_temp: 100, min_temp: 0)
//        self.presenter.fetchWeather(parameters: ["weather": "rainy", "max_temp": "100", "min_temp": "0"])
//    }
//}
//
//// WeahterModelのモック
//final class WeatherMockModel: WeatherModelType {
//
//    //「weather」と「temp」を返すモック
//    func fetchWeather(parameters: [String: String], completion: @escaping WeatherResult) {
//        let weather = parameters["weather"]!
//        let max_temp = Int(parameters["max_temp"]!)!
//        let min_temp = Int(parameters["min_temp"]!)!
//        let weatherEntity = WeatherEntity(weather: weather, max_temp: max_temp, min_temp: min_temp, date: "2020-04-01T12:00:00+09:00")
//        completion(.success(weatherEntity))
//    }
//}
//
//// WeatherViewのモック
//final class WeatherMockView: WeatherView {
//
//    private var targetWeather: String?
//    private var max_temp: Int?
//    private var min_temp: Int?
//
//    init(targetWeather: String, max_temp: Int, min_temp: Int) {
//        self.targetWeather = targetWeather
//        self.max_temp = max_temp
//        self.min_temp = min_temp
//    }
//
//    func showAlert(errorType: String, errorMessage: String) {
//    }
//
//    func showToast(message: String) {
//    }
//
//    func beginActivityIndicator() {
//    }
//
//    func endActivityIndicator() {
//    }
//
//    func changeWeatherImageView(weather: String) {
//        XCTAssertEqual(targetWeather, weather)
//    }
//
//    func changeTemperatureLabel(maxTemp: Int, minTemp: Int) {
//        XCTAssertEqual(max_temp, maxTemp)
//        XCTAssertEqual(min_temp, minTemp)
//    }
//}
