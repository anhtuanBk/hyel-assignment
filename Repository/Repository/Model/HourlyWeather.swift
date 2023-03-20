//
//  Weather.swift
//

import Foundation

// MARK: - HourlyWeather
public struct HourlyWeather: Codable {
    public let forecastHourly: ForecastHourly
}

// MARK: - ForecastHourly
public struct ForecastHourly: Codable {
    public let name: String
    public let metadata: Metadata
    public let hours: [Hour]
}

// MARK: - Hour
public struct Hour: Codable {
    public let forecastStart: Date
    public let cloudCover, cloudCoverLowAltPct, cloudCoverMidAltPct, cloudCoverHighAltPct: Double
    public let conditionCode: ConditionCode
    public let daylight: Bool
    public let humidity, precipitationAmount, precipitationIntensity, precipitationChance: Double
    public let precipitationType: String
    public let pressure: Double
    public let pressureTrend: PressureTrend
    public let snowfallIntensity, snowfallAmount: Int
    public let temperature, temperatureApparent, temperatureDewPoint: Double
    public let uvIndex: Int
    public let visibility: Double
    public let windDirection: Int
    public let windGust, windSpeed: Double
}

public enum ConditionCode: String, Codable {
    case cloudy = "Cloudy"
    case drizzle = "Drizzle"
    case mostlyCloudy = "MostlyCloudy"
    case mostlyClear = "MostlyClear"
    case windy = "Windy"
    case rain = "Rain"
    case partlyCloudy = "PartlyCloudy"
    case thunderstorms = "Thunderstorms"
    case clear = "Clear"
}

public enum PressureTrend: String, Codable {
    case falling = "falling"
    case rising = "rising"
    case steady = "steady"
}

// MARK: - Metadata
public struct Metadata: Codable {
    public let attributionURL: String
    public let expireTime: Date
    public let latitude, longitude: Double
    public let readTime: Date
    public let reportedTime: Date
    public let units: String
    public let version: Int
}
