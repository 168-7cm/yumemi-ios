//
//  WeatherModel.swift
//  yumemi-ios
//
//  Created by kou yamamoto on 2021/04/25.
//

import Foundation
import YumemiWeather

typealias WeatherResult = (Result<WeatherEntity, Error>) -> ()

protocol WeatherModelType {
    func fetchWeather(parameters: [String: String], completion: @escaping WeatherResult)
}

class WeatherModel: WeatherModelType {

    func fetchWeather(parameters: [String: String], completion: @escaping WeatherResult) {
        do {
            let json = changeToJsonString(parameters: parameters)
            let jsonString = try YumemiWeather.fetchWeather(json)
            let weatherEntity = changeToStruct(jsonString: jsonString)
            completion(.success(weatherEntity))
        } catch(let error) {
            completion(.failure(error))
        }
    }

    // Dictionaryからjsonに変換
    func changeToJsonString(parameters: [String: Any]) -> String {
        let jsonData = try! JSONSerialization.data(withJSONObject: parameters)
        let jsonString = String(bytes: jsonData, encoding: .utf8)
        return jsonString!
    }

    // jsonからStructに変換
    func changeToStruct(jsonString: String) -> WeatherEntity {
        let jsonData = jsonString.data(using: .utf8)!
        let weatherEntity = try! JSONDecoder().decode(WeatherEntity.self, from: jsonData)
        return weatherEntity
    }
}
