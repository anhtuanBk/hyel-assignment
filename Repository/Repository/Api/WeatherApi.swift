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
    func fetchWeatherDaily(_ location: CLLocationCoordinate2D) -> AnyPublisher<[Day], Error>
    func fetchWeatherHourly(_ location: CLLocationCoordinate2D, date: Date) -> AnyPublisher<[Hour], Error>
}
