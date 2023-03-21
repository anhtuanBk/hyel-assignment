//
//  WeatherApi.swift
//  Repository
//
//  Created by henry on 19/03/2023.
//

import Foundation
import Combine
import CoreLocation

public protocol WeatherApi {
    func fetchWeatherDaily(_ lat: Double, _ lon: Double) -> AnyPublisher<[Day], Error>
    func fetchWeatherHourly(_ lat: Double, _ lon: Double, date: Date) -> AnyPublisher<[Hour], Error>
}
