//
//  yumemi_iosTests.swift
//  yumemi-iosTests
//
//  Created by kou yamamoto on 2021/04/24.
//

import XCTest
import Cuckoo
@testable import yumemi_ios

class yumemi_iosTests: XCTestCase {

    // presenterとmodelはMockクラスを使用
    private var view: WeatherView!
    private var presenter: WeatherMockPresenter!
    private var model: WeatherMockModel!

    // 各テストメソッドの実行時に呼ばれる。
    override func setUp() {
        self.view = WeatherViewController.instansiate()
        self.model = WeatherMockModel()
        self.presenter = WeatherMockPresenter().inject(with: WeatherMockPresenter.Dependencies(view: view, model: model))
    }

    func testSunnyWeather() {
        let result = self.presenter.fetchWeather(weatherType: "sunny")
        XCTAssertEqual(result, "sunny")
    }

    func testCloudyWeahter() {
        let result = self.presenter.fetchWeather(weatherType: "cloudy")
        XCTAssertEqual(result, "cloudy")
    }

    func testRainyWeahter() {
        let result = self.presenter.fetchWeather(weatherType: "rainy")
        XCTAssertEqual(result, "rainy")
    }

    func testMaxTemperature() {
        let result = self.presenter.fetchTemperature(temperature: "100")
        XCTAssertEqual(result, "100")
    }

    func testMinTemperature() {
        let result = self.presenter.fetchTemperature(temperature: "0")
        XCTAssertEqual(result, "0")
    }
}
