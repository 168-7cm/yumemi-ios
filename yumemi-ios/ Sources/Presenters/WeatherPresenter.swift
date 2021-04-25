//
//  WeatherPresenter.swift
//  yumemi-ios
//
//  Created by kou yamamoto on 2021/04/25.
//

import Foundation

// MARK: PresenterがModelに対して、指示を出すためのProtocol
protocol WeatherPresenterInput {
    func fetchWeather()
}

// MARK: PresenterがViewに対して、指示を出すためのProtocol
protocol WeatherPresenterOutput: AnyObject {
}


class WeatherPresenter: WeatherPresenterInput {

    private weak var view: WeatherPresenterOutput!
    private var model: WeatherModelInput!

    init(view: WeatherPresenterOutput, model: WeatherModelInput) {
        self.view = view
        self.model = model
    }

    func fetchWeather() {
        model.fetchWeather()
    }
}
