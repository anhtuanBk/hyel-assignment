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
    func fetchDailyWeather(_ location: CLLocationCoordinate2D) -> Future<[Day], Error>
    func fetchHourlyWeather(_ location: CLLocationCoordinate2D, date: Date) -> Future<[Hour], Error>
    func clearIfNeeded()
}
