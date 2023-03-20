//
//  HourlyWeatherDao.swift
//  Repository
//
//  Created by henry on 20/03/2023.
//

import Foundation
import CoreLocation

public protocol HourlyWeatherDao {
    func getHourlyWeathers(_ location: CLLocationCoordinate2D, date: Date) -> [Hour]?
    func saveHourlyWeathers(_ location: CLLocationCoordinate2D, date: Date, hourlyWeathers: [Hour])
    func clearHourlyWeathers()
}
