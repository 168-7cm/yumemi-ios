//
//  WeatherEntity.swift
//  yumemi-ios
//
//  Created by kou yamamoto on 2021/05/04.
//

import Foundation

struct WeatherEntity: Decodable {
    let weather: String
    let max_temp: Int
    let min_temp: Int
    let date: String
}
