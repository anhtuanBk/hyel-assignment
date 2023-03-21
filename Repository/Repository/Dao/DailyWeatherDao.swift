//
//  WeatherDao.swift
//  Repository
//
//  Created by henry on 20/03/2023.
//

import Foundation
import CoreLocation

public protocol DailyWeatherDao {
    func getDailyWeathers(_ lat: Double, _ lon: Double) -> [Day]?
    func saveDailyWeathers(_ lat: Double, _ lon: Double, dailyWeathers: [Day])
    func clearDailyWeathers()
}
