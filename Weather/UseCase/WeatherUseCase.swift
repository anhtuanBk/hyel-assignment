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
    func loadDailyWeather(_ lat: Double, _ lon: Double) -> Future<[Day], Error>
    func loadHourlyWeather(_ lat: Double, _ lon: Double, date: Date) -> Future<[Hour], Error>
}
