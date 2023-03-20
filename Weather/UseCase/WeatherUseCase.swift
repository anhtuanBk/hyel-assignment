//
//  WeatherUseCase.swift
//  Weather
//
//  Created by henry on 20/03/2023.
//

import Foundation
import CoreLocation
import Combine
import Repository

public protocol WeatherUseCase {
    func loadDailyWeather(_ location: CLLocationCoordinate2D) -> Future<[Day], Error>
    func loadHourlyWeather(_ location: CLLocationCoordinate2D, date: Date) -> Future<[Hour], Error>
}
