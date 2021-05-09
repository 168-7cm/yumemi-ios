//
//  WeatherMockModel.swift
//  yumemi-iosTests
//
//  Created by kou yamamoto on 2021/05/09.
//

import Foundation
@testable import yumemi_ios

protocol WeatherMockModelProtocol {
    func fetchWeahter(weatherType: String) -> String
    func fetchTemperature(temperature: String) -> String
}

final class WeatherMockModel: WeatherMockModelProtocol {

    func fetchWeahter(weatherType: String) -> String {
        return weatherType
    }

    func fetchTemperature(temperature: String) -> String {
        return temperature
    }
}
