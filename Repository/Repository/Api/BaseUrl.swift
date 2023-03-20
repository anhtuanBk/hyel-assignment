//
//  BaseUrl.swift
//  Repository
//
//

import Foundation
import CoreLocation

public enum Endpoints {
    case fetchWeatherDaily(location: CLLocationCoordinate2D)
    case fetchWeatherHourly(location: CLLocationCoordinate2D, date: Date)
}

public class BaseUrl {
    let apiEndpointUrl: String
    let dateFormatter: DateFormatter
    
    init(apiEndpointUrl: String, dateFormatter: DateFormatter = DateFormatter()) {
        self.apiEndpointUrl = apiEndpointUrl
        self.dateFormatter = dateFormatter
    }
    
    public convenience init() {
        self.init(apiEndpointUrl: "https://weatherkit.apple.com")
    }
    
    public func path(for endpoint: Endpoints) -> String {
        switch endpoint {
        case .fetchWeatherDaily(let location):
            return "/api/v1/weather/en_US/\(location.latitude)/\(location.longitude)?dataSets=forecastDaily"
        case .fetchWeatherHourly(let location, let date):
            dateFormatter.dateFormat = "yyyy-MM-dd"
            let dateComponent = dateFormatter.string(from: date)
            return "/api/v1/weather/en_US/\(location.latitude)/\(location.longitude)?dataSets=forecastHourly&hourlyStart=\(dateComponent)T00:00:00Z&hourlyEnd=\(dateComponent)T23:59:59Z"
        }
    }
    
    public func getRequest(of endpoint: Endpoints) -> URLRequest {
        let url = URL(string: "\(apiEndpointUrl)\(path(for: endpoint))")!
        var request = URLRequest(url: url)
        // hardcoded for the sake of assignment only, need properly token manager in real-world scenario
        request.setValue("Bearer eyJhbGciOiJFUzI1NiIsImtpZCI6IkZENFRaNTk1V0EiLCJpZCI6IkFXUjIyNDc5TTQuY29tLmh5ZWwuaW9zLndlYXRoZXIiLCJ0eXAiOiJKV1QifQ.eyJpYXQiOjE2Nzg5NTE1NTksImV4cCI6MTY4OTEzNDY0NiwiaXNzIjoiQVdSMjI0NzlNNCIsInN1YiI6ImNvbS5oeWVsLmlvcy53ZWF0aGVyIn0.1DJn1h9SAh4V_-e74epRRINhEbDdYeq8SUnjP7RtzhXMMmOGOxwIwQOEjSeB5Qv5mpVyteY5bif5ijAQWcZ9TA", forHTTPHeaderField: "Authorization")
        return request
    }
}
