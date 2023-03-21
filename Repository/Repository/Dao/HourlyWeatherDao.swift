//
//  HourlyWeatherDao.swift
//  Repository
//
//  Created by henry on 20/03/2023.
//

import Foundation
import CoreLocation

public protocol HourlyWeatherDao {
    func getHourlyWeathers(_ lat: Double, _ lon: Double, date: Date) -> [Hour]?
    func saveHourlyWeathers(_ lat: Double, _ lon: Double, date: Date, hourlyWeathers: [Hour])
    func clearHourlyWeathers()
}
