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
            weatherImageView.image = UIImage(named: "sunny")?.withRenderingMode(.alwaysTemplate)
            weatherImageView.tintColor = .red
        case "cloudy":
            weatherImageView.image = UIImage(named: "cloudy")?.withRenderingMode(.alwaysTemplate)
            weatherImageView.tintColor = .gray
        case "rainy":
            weatherImageView.image = UIImage(named: "rainy")?.withRenderingMode(.alwaysTemplate)
            weatherImageView.tintColor = .blue
        default:
            break
        }
    }
}
