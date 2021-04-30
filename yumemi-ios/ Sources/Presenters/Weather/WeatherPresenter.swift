//
//  WeatherPresenter.swift
//  yumemi-ios
//
//  Created by kou yamamoto on 2021/04/25.
//

import Foundation

protocol WeatherPresenterType: PresenterBase {
}

final class WeatherPresenter {

    // MARK: Dependency
    typealias Dependency = Dpendencies
    struct Dpendencies {
        let view: WeatherView
    }

    private weak var view: WeatherView?
    
}
