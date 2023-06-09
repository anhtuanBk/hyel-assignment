//
//  WeatherUseCaseImpl.swift
//  Weather
//
//  Created by henry on 20/03/2023.
//

import Foundation
import CoreLocation
import Combine
import Repository

public class WeatherUseCaseImpl: WeatherUseCase {
    private let weatherRepository: WeatherRepository
    private var bag = Set<AnyCancellable>()
    
    public init(weatherRepository: WeatherRepository) {
        self.weatherRepository = weatherRepository
    }
    
    public func loadDailyWeather(_ lat: Double, _ lon: Double) -> Future<[Day], Error> {
        return Future { [unowned self] promise in
            self.weatherRepository.fetchDailyWeather(lat, lon)
                .sink(receiveCompletion: { completion in
                    switch completion {
                    case .failure(let error):
                        promise(.failure(error))
                    default: break
                    }
                }, receiveValue: { days in
                    promise(.success(days))
                })
                .store(in: &self.bag)
        }
    }
    
    public func loadHourlyWeather(_ lat: Double, _ lon: Double, date: Date) -> Future<[Hour], Error> {
        return Future { [unowned self] promise in
            self.weatherRepository.fetchHourlyWeather(lat, lon, date: date)
                .sink(receiveCompletion: { completion in
                    switch completion {
                    case .failure(let error):
                        promise(.failure(error))
                    default: break
                    }
                }, receiveValue: { hours in
                    promise(.success(hours))
                })
                .store(in: &self.bag)
        }
    }
}
