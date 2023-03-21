//
//  WeatherApiImpl.swift
//  Repository
//
//  Created by henry on 19/03/2023.
//

import Foundation
import Combine
import CoreLocation

public class WeatherApiIml: BaseApi, WeatherApi {
    public override init(_ baseUrl: BaseUrl, urlSession: URLSession = URLSession.shared, retryTimes: Int = 3) {
        super.init(baseUrl, urlSession: urlSession, retryTimes: retryTimes)
    }
    
    public func fetchWeatherDaily(_ lat: Double, _ lon: Double) -> AnyPublisher<[Day], Error> {
        let daily: AnyPublisher<DailyWeather, Error> = get(path: .fetchWeatherDaily(lat, lon))
        return daily
            .map(\.forecastDaily.days)
            .eraseToAnyPublisher()
    }
    
    public func fetchWeatherHourly(_ lat: Double, _ lon: Double, date: Date) -> AnyPublisher<[Hour], Error> {
        let hourly: AnyPublisher<HourlyWeather, Error> = get(path: .fetchWeatherHourly(lat, lon, date))
        return hourly
            .map(\.forecastHourly.hours)
            .eraseToAnyPublisher()
    }
}
