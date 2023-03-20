//
//  HourlyWeatherViewModel.swift
//

import Foundation
import CoreLocation
import Combine
import Repository

class HourlyWeatherViewModel: ObservableObject {
    private let weatherUseCase: WeatherUseCase
    
    @Published var hours = [Hour]()
    @Published var isLoading: Bool = false
    @Published var errorMessage: String? = nil
    
    private var bag = Set<AnyCancellable>()
    
    init(_ weatherUseCase: WeatherUseCase) {
        self.weatherUseCase = weatherUseCase
    }
    
    func loadHourlyData(location: CLLocationCoordinate2D, date: Date) {
        isLoading = true
        errorMessage = nil
        
        weatherUseCase.loadHourlyWeather(location, date: date)
            .receive(on: DispatchQueue.main)
            .sink { [weak self] completion in
                self?.isLoading = false
                switch completion {
                case .failure(let error):
                    self?.errorMessage = error.localizedDescription
                    print(error)
                default: break
                }
            } receiveValue: { [weak self] hours in
                self?.isLoading = false
                self?.hours = hours
            }
            .store(in: &bag)
    }
}
