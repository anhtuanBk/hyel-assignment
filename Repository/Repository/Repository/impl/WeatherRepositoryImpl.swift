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
    
    public func fetchDailyWeather(_ location: CLLocationCoordinate2D) -> Future<[Day], Error> {
        return Future { [weak self] promise in
            guard let self = self else {
                promise(.failure(CancellationError()))
                return
            }
            if let cached = self.dailyWeatherDao.getDailyWeathers(location) {
                promise(.success(cached))
                return
            }
            
            self.weatherApi.fetchWeatherDaily(location)
                .sink(receiveCompletion: { completion in
                    switch completion {
                    case .finished:
                        break
                    case .failure(let error):
                        promise(.failure(error))
                    }
                }, receiveValue: { items in
                    self.dailyWeatherDao.saveDailyWeathers(location, dailyWeathers: items)
                    promise(.success(items))
                })
                .store(in: &self.disposables)
        }
    }
    
    public func fetchHourlyWeather(_ location: CLLocationCoordinate2D, date: Date) -> Future<[Hour], Error> {
        return Future { [weak self] promise in
            guard let self = self else {
                promise(.failure(CancellationError()))
                return
            }
            if let cached = self.hourlyWeatherDao.getHourlyWeathers(location, date: date) {
                promise(.success(cached))
                return
            }
            
            self.weatherApi.fetchWeatherHourly(location, date: date)
                .sink(receiveCompletion: { completion in
                    switch completion {
                    case .finished:
                        break
                    case .failure(let error):
                        promise(.failure(error))
                    }
                }, receiveValue: { items in
                    self.hourlyWeatherDao.saveHourlyWeathers(location, date: date, hourlyWeathers: items)
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
