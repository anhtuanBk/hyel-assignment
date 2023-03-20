//
//  DailyWeather.swift
//

import Foundation

// MARK: - DailyWeather
public struct DailyWeather: Codable {
    public let forecastDaily: ForecastDaily
}

// MARK: - ForecastDaily
public struct ForecastDaily: Codable {
    public let name: String
    //    let metadata: Metadata
    public let days: [Day]
}

// MARK: - Day
public struct Day: Codable {
    public let forecastStart, forecastEnd: Date
    public let conditionCode: ConditionCode
    public let maxUvIndex: Int
    public let moonPhase: String
    public let moonrise: Date?
    public let moonset: Date?
    public let precipitationAmount, precipitationChance: Double
    public let precipitationType: String
    public let snowfallAmount: Int
    public let solarMidnight, solarNoon, sunrise, sunriseCivil: Date
    public let sunriseNautical, sunriseAstronomical, sunset, sunsetCivil: Date
    public let sunsetNautical, sunsetAstronomical: Date
    public let temperatureMax, temperatureMin: Double
    public let daytimeForecast, overnightForecast: Forecast
    public let restOfDayForecast: Forecast?
}

// MARK: - Forecast
public struct Forecast: Codable {
    public let forecastStart, forecastEnd: Date
    public let cloudCover: Double
    public let conditionCode: String
    public let humidity, precipitationAmount, precipitationChance: Double
    public let snowfallAmount, windDirection: Int
    public let windSpeed: Double
}
