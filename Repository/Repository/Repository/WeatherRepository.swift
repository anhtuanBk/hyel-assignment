//
//  WeatherRepository.swift
//  Repository
//
//  Created by henry on 20/03/2023.
//

import Foundation
import Combine
import CoreLocation

public protocol WeatherRepository {
    func fetchDailyWeather(_ lat: Double, _ lon: Double) -> Future<[Day], Error>
    func fetchHourlyWeather(_ lat: Double, _ lon: Double, date: Date) -> Future<[Hour], Error>
    func clearIfNeeded()
}
