//
//  WeatherRepositoryImpl.swift
//  Repository
//
//  Created by henry on 20/03/2023.
//

import Foundation
import Combine
import CoreLocation

public class WeatherRepositoryImpl: WeatherRepository {
    private var weatherApi: WeatherApi
    private var dailyWeatherDao: DailyWeatherDao
    private var hourlyWeatherDao: HourlyWeatherDao
    private var disposables = Set<AnyCancellable>()
    
    public init(weatherApi: WeatherApi, dailyWeatherDao: DailyWeatherDao, hourlyWeatherDao: HourlyWeatherDao) {
        self.weatherApi = weatherApi
        self.dailyWeatherDao = dailyWeatherDao
        self.hourlyWeatherDao = hourlyWeatherDao
    }
    
    public func fetchDailyWeather(_ lat: Double, _ lon: Double) -> Future<[Day], Error> {
        return Future { [weak self] promise in
            guard let self = self else {
                promise(.failure(CancellationError()))
                return
            }
            if let cached = self.dailyWeatherDao.getDailyWeathers(lat, lon) {
                promise(.success(cached))
                return
            }
            
            self.weatherApi.fetchWeatherDaily(lat, lon)
                .sink(receiveCompletion: { completion in
                    switch completion {
                    case .finished:
                        break
                    case .failure(let error):
                        promise(.failure(error))
                    }
                }, receiveValue: { items in
                    self.dailyWeatherDao.saveDailyWeathers(lat, lon, dailyWeathers: items)
                    promise(.success(items))
                })
                .store(in: &self.disposables)
        }
    }
    
    public func fetchHourlyWeather(_ lat: Double, _ lon: Double, date: Date) -> Future<[Hour], Error> {
        return Future { [weak self] promise in
            guard let self = self else {
                promise(.failure(CancellationError()))
                return
            }
            if let cached = self.hourlyWeatherDao.getHourlyWeathers(lat, lon, date: date) {
                promise(.success(cached))
                return
            }
            
            self.weatherApi.fetchWeatherHourly(lat, lon, date: date)
                .sink(receiveCompletion: { completion in
                    switch completion {
                    case .finished:
                        break
                    case .failure(let error):
                        promise(.failure(error))
                    }
                }, receiveValue: { items in
                    self.hourlyWeatherDao.saveHourlyWeathers(lat, lon, date: date, hourlyWeathers: items)
                    promise(.success(items))
                })
                .store(in: &self.disposables)
        }
    }
    
    public func clearIfNeeded() {
        dailyWeatherDao.clearDailyWeathers()
        hourlyWeatherDao.clearHourlyWeathers()
    }
}
