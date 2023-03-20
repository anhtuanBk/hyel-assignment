//
//  Routes.swift

//
//

import Repository
import SwiftUI

extension NavigationRouteLink {
    static var splash: NavigationRouteLink { "/splash" }
    static var dailyWeather: NavigationRouteLink { "/dailyWeather" }
}

extension Array where Element == NavigationRoute {
    static var all: [NavigationRoute] {
        let splash = NavigationRoute(path: "/splash", destination: SplashScreen())
        let dailyWeather = NavigationRoute(path: "/dailyWeather") {
            DailyWeatherView(locationManager: AppState.shared.locationManager())
                .provideViewModel {
                    DailyWeatherViewModel(UseCases.weatherUseCase())
                }
        }
        return [splash, dailyWeather]
    }
}
