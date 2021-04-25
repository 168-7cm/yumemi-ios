//
//  WeatherViewController.swift
//  yumemi-ios
//
//  Created by kou yamamoto on 2021/04/24.
//

import UIKit
import YumemiWeather

class WeatherViewController: UIViewController {

    @IBOutlet weak var weatherImageView: UIImageView!

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func reloadButtonDidTapped(_ sender: Any) {
        let weatherType = YumemiWeather.fetchWeather()
        changeWeatherImageView(weatherType: weatherType)
    }

    private func changeWeatherImageView(weatherType: String) {
        switch weatherType {
        case "sunny":
            weatherImageView.image = UIImage(named: "sunny")
        case "cloudy":
            weatherImageView.image = UIImage(named: "cloudy")
        case "rainy":
            weatherImageView.image = UIImage(named: "rainy")
        default:
            break
        }
    }
}
