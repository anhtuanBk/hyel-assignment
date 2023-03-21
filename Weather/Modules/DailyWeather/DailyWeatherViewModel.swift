//
//  DailyViewModel.swift
//

import Foundation
import CoreLocation
import Repository
import Combine

class DailyWeatherViewModel: ObservableObject {
    private let weatherUseCase: WeatherUseCase
    
    @Published var days = [Day]()
    @Published var isLoading: Bool = false
    @Published var errorMessage: String? = nil
    
    private var bag = Set<AnyCancellable>()
    
    init(_ weatherUseCase: WeatherUseCase) {
        self.weatherUseCase = weatherUseCase
    }
    
    func loadDailyData(location: CLLocationCoordinate2D) {
        isLoading = true
        errorMessage = nil
        
        weatherUseCase.loadDailyWeather(location.latitude, location.longitude)
            .receive(on: DispatchQueue.main)
            .sink { [weak self] completion in
                self?.isLoading = false
                switch completion {
                case .failure(let error):
                    self?.errorMessage = error.localizedDescription
                    print(error)
                default: break
                }
            } receiveValue: { [weak self] days in
                self?.isLoading = false
                self?.days = days
            }
            .store(in: &bag)
    }
}
