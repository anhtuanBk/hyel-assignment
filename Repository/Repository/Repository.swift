//
//  repository.swift
//  repository
//
//

public class Repository {
    public static let shared = Repository()
    private let baseUrl: BaseUrl
    
    init() {
        self.baseUrl = BaseUrl(apiEndpointUrl: RepositoryConfigs.shared.apiEndpointUrl)
    }
    
    public func weatherRepository() -> WeatherRepository {
        return WeatherRepositoryImpl(weatherApi: weatherApi(),
                                     dailyWeatherDao: dailyWeatherDao(),
                                     hourlyWeatherDao: hourlyWeatherDao())
    }
    
    func weatherApi() -> WeatherApi {
        return WeatherApiIml(baseUrl)
    }
    
    func dailyWeatherDao() -> DailyWeatherDao {
        return DailyWeatherDaoImpl()
    }
    
    func hourlyWeatherDao() -> HourlyWeatherDao {
        return HourlyWeatherDaoImpl()
    }
}
