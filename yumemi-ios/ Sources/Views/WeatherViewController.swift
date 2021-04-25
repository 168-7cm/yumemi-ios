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

    private var presenter: WeatherPresenterOutput!

    func inject(presenter: WeatherPresenterOutput) {
        self.presenter = presenter
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func reloadButtonDidTapped(_ sender: Any) {
        do {
            let weatherType = try YumemiWeather.fetchWeather(at: "tokyo")
            changeWeatherImageView(weatherType: weatherType)
        } catch(let error) {
            showAlert(errorType: "\(error)", errorMessage: error.localizedDescription)
        }
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

    private func showAlert(errorType: String, errorMessage: String) {
        let alertViewController = UIAlertController(title: errorType, message: errorMessage, preferredStyle: .alert)
        alertViewController.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        present(alertViewController, animated: true, completion: nil)
    }
}

extension WeatherViewController: WeatherPresenterOutput {

}
