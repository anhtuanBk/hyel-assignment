//
//  WeatherDao.swift
//  Repository
//
//  Created by henry on 20/03/2023.
//

import Foundation
import CoreLocation

public protocol DailyWeatherDao {
    func getDailyWeathers(_ location: CLLocationCoordinate2D) -> [Day]?
    func saveDailyWeathers(_ location: CLLocationCoordinate2D, dailyWeathers: [Day])
    func clearDailyWeathers()
}
