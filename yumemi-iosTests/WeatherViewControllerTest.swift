//
//  WeatherViewControllerTest.swift
//  yumemi-iosTests
//
//  Created by kou yamamoto on 2021/05/19.
//

import XCTest
@testable import yumemi_ios

class WeatherViewControllerTests: XCTestCase {

    private var view: WeatherViewController!
    private var presenter: WeatherPresenterType!
    private var model: WeatherModelType!
    private let expection = XCTestExpectation()

    override func setUp() {
        self.view = WeatherViewController.instansiate()
        self.model = WeatherMockModel_ViewControllerTest()
        self.presenter = WeatherPresenter().inject(with: WeatherPresenter.Dependency(view: self.view, model: self.model))
    }

    func test_天気予報がsunnyの場合ImageViewのImageがsunnyになること() {
        let parameters = ["weather": "sunny", "max_temp": "100", "min_temp": "0"]
        self.presenter.fetchWeather(parameters: parameters)

        DispatchQueue.main.asyncAfter(deadline: .now()) {
            XCTAssertEqual(self.view.weatherImageView.image, R.image.sunny()?.withRenderingMode(.alwaysTemplate))
            XCTAssertEqual(self.view.weatherImageView.tintColor, UIColor.red)
            self.expection.fulfill()
        }
        wait(for: [expection], timeout: 1)
    }

    func test_天気予報がcloudyの場合ImageViewのImageにcloudyになること() {
        let parameters = ["weather": "cloudy", "max_temp": "100", "min_temp": "0"]
        self.presenter.fetchWeather(parameters: parameters)

        DispatchQueue.main.asyncAfter(deadline: .now()) {
            XCTAssertEqual(self.view.weatherImageView.image, R.image.cloudy()?.withRenderingMode(.alwaysTemplate))
            XCTAssertEqual(self.view.weatherImageView.tintColor, .gray)
            self.expection.fulfill()
        }
        wait(for: [expection], timeout: 1)
    }

    func test_天気予報がrainyの場合ImageViewのImageにrainyになること() {
        let parameters = ["weather": "rainy", "max_temp": "100", "min_temp": "0"]
        self.presenter.fetchWeather(parameters: parameters)

        DispatchQueue.main.asyncAfter(deadline: .now()) {
            XCTAssertEqual(self.view.weatherImageView.image, R.image.rainy()?.withRenderingMode(.alwaysTemplate))
            XCTAssertEqual(self.view.weatherImageView.tintColor, .blue)
            self.expection.fulfill()
        }
        wait(for: [expection], timeout: 1)
    }

    func test_最高気温と最低気温がLabelに表示される() {

    }
}

// ViewControllerテスト用のWeahterModelのモック
final class WeatherMockModel_ViewControllerTest: WeatherModelType {

    func fetchWeather(parameters: [String: String], completion: @escaping WeatherResult) {
        let weather = parameters["weather"]!
        let max_temp = Int(parameters["max_temp"]!)!
        let min_temp = Int(parameters["min_temp"]!)!
        let weatherEntity = WeatherEntity(weather: weather, max_temp: max_temp, min_temp: min_temp, date: "2020-04-01T12:00:00+09:00")
        completion(.success(weatherEntity))
    }
}
