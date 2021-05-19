//
//  WeatherViewController.swift
//  yumemi-ios
//
//  Created by kou yamamoto on 2021/04/24.
//

import UIKit
import YumemiWeather

protocol WeatherView: ViewBase {
    func changeWeatherImageView(weather: String)
    func changeTemperatureLabel(maxTemp: Int, minTemp: Int)
    func showAlert(errorType: String, errorMessage: String)
}

final class WeatherViewController: ViewControllerBase {

    @IBOutlet private weak var weatherImageView: UIImageView!
    @IBOutlet private weak var maxTempLabel: UILabel!
    @IBOutlet private weak var minTempLabel: UILabel!

    typealias Dependency = Dependencies
    struct Dependencies {
        let presenter: WeatherPresenterType
    }

    private var presenter: WeatherPresenterType?
    private let parameters = ["area": "tokyo", "date": "2020-04-01T12:00:00+09:00"]

    override func viewDidLoad() {
        NotificationCenter.default.addObserver(self, selector: #selector(viewWillEnterForeground), name: .foreground, object: nil)
    }

    @objc private func viewWillEnterForeground() {
        self.presenter?.fetchWeather(parameters: parameters)
    }

    @IBAction func reloadButtonDidTapped(_ sender: Any) {
        self.presenter?.fetchWeather(parameters: parameters)
    }

    @IBAction func closeButtonDidTapped(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
}

extension WeatherViewController: ViewControllerInstantiable {
    static func instansiate() -> WeatherViewController {
        return R.storyboard.weather.weather()!
    }

    func inject(with dependency: Dependencies) {
        self.presenter = dependency.presenter
    }
} 

extension WeatherViewController: WeatherView {

    func changeWeatherImageView(weather: String) {
        switch weather {
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

    func changeTemperatureLabel(maxTemp: Int, minTemp: Int) {
        self.maxTempLabel.text = String(maxTemp)
        self.minTempLabel.text = String(minTemp)
    }

    func showAlert(errorType: String, errorMessage: String) {
        let alertViewController = UIAlertController(title: errorType, message: errorMessage, preferredStyle: .alert)
        alertViewController.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        present(alertViewController, animated: true, completion: nil)
    }
}
