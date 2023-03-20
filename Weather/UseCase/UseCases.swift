//
//  UseCases.swift

//
//

import Foundation
import Repository

// Dependency Injection for UseCase layer
class UseCases {
    static func weatherUseCase() -> WeatherUseCase {
        return WeatherUseCaseImpl(weatherRepository: Repository.shared.weatherRepository())
    }
}
