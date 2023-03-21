//
//  WeatherApiTests.swift
//

import XCTest
import Repository
import Mockingbird
import Combine
import CoreLocation

class WeatherApiTests: XCTestCase {
    
    private var weatherApi: WeatherApi!
    private var cancellables: Set<AnyCancellable>!
    
    private let dailyWeatherJson = """
            {"forecastDaily":{"name":"DailyForecast","metadata":{"attributionURL":"https://weatherkit.apple.com/legal-attribution.html","expireTime":"2023-03-17T03:25:55Z","latitude":34.052,"longitude":118.240,"readTime":"2023-03-17T02:25:55Z","reportedTime":"2023-03-17T01:01:15Z","units":"m","version":1},"days":[{"forecastStart":"2023-03-16T16:00:00Z","forecastEnd":"2023-03-17T16:00:00Z","conditionCode":"Rain","maxUvIndex":4,"moonPhase":"thirdQuarter","moonrise":"2023-03-16T19:15:08Z","moonset":"2023-03-17T04:58:49Z","precipitationAmount":6.4,"precipitationChance":0.92,"precipitationType":"rain","snowfallAmount":0.00,"solarMidnight":"2023-03-16T16:15:33Z","solarNoon":"2023-03-17T04:15:45Z","sunrise":"2023-03-16T22:15:52Z","sunriseCivil":"2023-03-16T21:50:59Z","sunriseNautical":"2023-03-16T21:21:59Z","sunriseAstronomical":"2023-03-16T20:52:43Z","sunset":"2023-03-17T10:15:56Z","sunsetCivil":"2023-03-17T10:40:53Z","sunsetNautical":"2023-03-17T11:09:56Z","sunsetAstronomical":"2023-03-17T11:39:19Z","temperatureMax":7.89,"temperatureMin":2.06,"daytimeForecast":{"forecastStart":"2023-03-16T23:00:00Z","forecastEnd":"2023-03-17T11:00:00Z","cloudCover":0.88,"conditionCode":"Cloudy","humidity":0.77,"precipitationAmount":0.0,"precipitationChance":0.00,"precipitationType":"clear","snowfallAmount":0.00,"windDirection":58,"windSpeed":14.58},"overnightForecast":{"forecastStart":"2023-03-17T11:00:00Z","forecastEnd":"2023-03-17T23:00:00Z","cloudCover":0.23,"conditionCode":"MostlyClear","humidity":0.80,"precipitationAmount":0.0,"precipitationChance":0.00,"precipitationType":"clear","snowfallAmount":0.00,"windDirection":43,"windSpeed":5.46},"restOfDayForecast":{"forecastStart":"2023-03-17T02:25:55Z","forecastEnd":"2023-03-17T16:00:00Z","cloudCover":0.62,"conditionCode":"PartlyCloudy","humidity":0.74,"precipitationAmount":0.0,"precipitationChance":0.00,"precipitationType":"clear","snowfallAmount":0.00,"windDirection":62,"windSpeed":10.44}},{"forecastStart":"2023-03-17T16:00:00Z","forecastEnd":"2023-03-18T16:00:00Z","conditionCode":"MostlyCloudy","maxUvIndex":4,"moonPhase":"waningCrescent","moonrise":"2023-03-17T20:07:06Z","moonset":"2023-03-18T06:12:15Z","precipitationAmount":0.0,"precipitationChance":0.00,"precipitationType":"clear","snowfallAmount":0.00,"solarMidnight":"2023-03-17T16:15:16Z","solarNoon":"2023-03-18T04:15:28Z","sunrise":"2023-03-17T22:14:31Z","sunriseCivil":"2023-03-17T21:49:38Z","sunriseNautical":"2023-03-17T21:20:36Z","sunriseAstronomical":"2023-03-17T20:51:19Z","sunset":"2023-03-18T10:16:43Z","sunsetCivil":"2023-03-18T10:41:40Z","sunsetNautical":"2023-03-18T11:10:44Z","sunsetAstronomical":"2023-03-18T11:40:10Z","temperatureMax":12.49,"temperatureMin":1.81,"daytimeForecast":{"forecastStart":"2023-03-17T23:00:00Z","forecastEnd":"2023-03-18T11:00:00Z","cloudCover":0.89,"conditionCode":"Cloudy","humidity":0.57,"precipitationAmount":0.0,"precipitationChance":0.00,"precipitationType":"clear","snowfallAmount":0.00,"windDirection":17,"windSpeed":5.83},"overnightForecast":{"forecastStart":"2023-03-18T11:00:00Z","forecastEnd":"2023-03-18T23:00:00Z","cloudCover":0.90,"conditionCode":"Cloudy","humidity":0.67,"precipitationAmount":0.0,"precipitationChance":0.00,"precipitationType":"clear","snowfallAmount":0.00,"windDirection":151,"windSpeed":6.69}},{"forecastStart":"2023-03-18T16:00:00Z","forecastEnd":"2023-03-19T16:00:00Z","conditionCode":"MostlyCloudy","maxUvIndex":5,"moonPhase":"waningCrescent","moonrise":"2023-03-18T20:51:09Z","moonset":"2023-03-19T07:26:52Z","precipitationAmount":0.0,"precipitationChance":0.00,"precipitationType":"clear","snowfallAmount":0.00,"solarMidnight":"2023-03-18T16:14:59Z","solarNoon":"2023-03-19T04:15:10Z","sunrise":"2023-03-18T22:13:09Z","sunriseCivil":"2023-03-18T21:48:17Z","sunriseNautical":"2023-03-18T21:19:13Z","sunriseAstronomical":"2023-03-18T20:49:54Z","sunset":"2023-03-19T10:17:30Z","sunsetCivil":"2023-03-19T10:42:27Z","sunsetNautical":"2023-03-19T11:11:33Z","sunsetAstronomical":"2023-03-19T11:41:00Z","temperatureMax":15.12,"temperatureMin":5.32,"daytimeForecast":{"forecastStart":"2023-03-18T23:00:00Z","forecastEnd":"2023-03-19T11:00:00Z","cloudCover":0.66,"conditionCode":"MostlyCloudy","humidity":0.51,"precipitationAmount":0.0,"precipitationChance":0.00,"precipitationType":"clear","snowfallAmount":0.00,"windDirection":135,"windSpeed":11.72},"overnightForecast":{"forecastStart":"2023-03-19T11:00:00Z","forecastEnd":"2023-03-19T23:00:00Z","cloudCover":0.52,"conditionCode":"PartlyCloudy","humidity":0.74,"precipitationAmount":0.0,"precipitationChance":0.00,"precipitationType":"clear","snowfallAmount":0.00,"windDirection":131,"windSpeed":11.01}},{"forecastStart":"2023-03-19T16:00:00Z","forecastEnd":"2023-03-20T16:00:00Z","conditionCode":"PartlyCloudy","maxUvIndex":6,"moonPhase":"waningCrescent","moonrise":"2023-03-19T21:28:41Z","moonset":"2023-03-20T08:40:03Z","precipitationAmount":0.0,"precipitationChance":0.00,"precipitationType":"clear","snowfallAmount":0.00,"solarMidnight":"2023-03-19T16:14:41Z","solarNoon":"2023-03-20T04:14:53Z","sunrise":"2023-03-19T22:11:47Z","sunriseCivil":"2023-03-19T21:46:55Z","sunriseNautical":"2023-03-19T21:17:49Z","sunriseAstronomical":"2023-03-19T20:48:29Z","sunset":"2023-03-20T10:18:16Z","sunsetCivil":"2023-03-20T10:43:14Z","sunsetNautical":"2023-03-20T11:12:21Z","sunsetAstronomical":"2023-03-20T11:41:52Z","temperatureMax":15.53,"temperatureMin":5.75,"daytimeForecast":{"forecastStart":"2023-03-19T23:00:00Z","forecastEnd":"2023-03-20T11:00:00Z","cloudCover":0.49,"conditionCode":"PartlyCloudy","humidity":0.68,"precipitationAmount":0.0,"precipitationChance":0.00,"precipitationType":"clear","snowfallAmount":0.00,"windDirection":139,"windSpeed":13.75},"overnightForecast":{"forecastStart":"2023-03-20T11:00:00Z","forecastEnd":"2023-03-20T23:00:00Z","cloudCover":0.93,"conditionCode":"Cloudy","humidity":0.87,"precipitationAmount":0.0,"precipitationChance":0.00,"precipitationType":"clear","snowfallAmount":0.00,"windDirection":116,"windSpeed":10.65}},{"forecastStart":"2023-03-20T16:00:00Z","forecastEnd":"2023-03-21T16:00:00Z","conditionCode":"Thunderstorms","maxUvIndex":4,"moonPhase":"new","moonrise":"2023-03-20T22:01:36Z","moonset":"2023-03-21T09:50:57Z","precipitationAmount":0.0,"precipitationChance":0.52,"precipitationType":"rain","snowfallAmount":0.00,"solarMidnight":"2023-03-20T16:14:23Z","solarNoon":"2023-03-21T04:14:35Z","sunrise":"2023-03-20T22:10:25Z","sunriseCivil":"2023-03-20T21:45:33Z","sunriseNautical":"2023-03-20T21:16:25Z","sunriseAstronomical":"2023-03-20T20:47:03Z","sunset":"2023-03-21T10:19:03Z","sunsetCivil":"2023-03-21T10:44:01Z","sunsetNautical":"2023-03-21T11:13:10Z","sunsetAstronomical":"2023-03-21T11:42:43Z","temperatureMax":17.03,"temperatureMin":10.43,"daytimeForecast":{"forecastStart":"2023-03-20T23:00:00Z","forecastEnd":"2023-03-21T11:00:00Z","cloudCover":0.96,"conditionCode":"Thunderstorms","humidity":0.84,"precipitationAmount":0.0,"precipitationChance":0.47,"precipitationType":"rain","snowfallAmount":0.00,"windDirection":94,"windSpeed":8.02},"overnightForecast":{"forecastStart":"2023-03-21T11:00:00Z","forecastEnd":"2023-03-21T23:00:00Z","cloudCover":0.91,"conditionCode":"Drizzle","humidity":0.94,"precipitationAmount":2.5,"precipitationChance":0.40,"precipitationType":"rain","snowfallAmount":0.00,"windDirection":73,"windSpeed":11.64}},{"forecastStart":"2023-03-21T16:00:00Z","forecastEnd":"2023-03-22T16:00:00Z","conditionCode":"Rain","maxUvIndex":4,"moonPhase":"new","moonrise":"2023-03-21T22:32:01Z","moonset":"2023-03-22T10:59:51Z","precipitationAmount":9.7,"precipitationChance":0.76,"precipitationType":"rain","snowfallAmount":0.00,"solarMidnight":"2023-03-21T16:14:06Z","solarNoon":"2023-03-22T04:14:17Z","sunrise":"2023-03-21T22:09:03Z","sunriseCivil":"2023-03-21T21:44:11Z","sunriseNautical":"2023-03-21T21:15:01Z","sunriseAstronomical":"2023-03-21T20:45:37Z","sunset":"2023-03-22T10:19:49Z","sunsetCivil":"2023-03-22T10:44:48Z","sunsetNautical":"2023-03-22T11:13:59Z","sunsetAstronomical":"2023-03-22T11:43:34Z","temperatureMax":16.14,"temperatureMin":11.01,"daytimeForecast":{"forecastStart":"2023-03-21T23:00:00Z","forecastEnd":"2023-03-22T11:00:00Z","cloudCover":0.99,"conditionCode":"Rain","humidity":0.83,"precipitationAmount":2.5,"precipitationChance":0.69,"precipitationType":"rain","snowfallAmount":0.00,"windDirection":60,"windSpeed":16.36},"overnightForecast":{"forecastStart":"2023-03-22T11:00:00Z","forecastEnd":"2023-03-22T23:00:00Z","cloudCover":0.97,"conditionCode":"Rain","humidity":0.80,"precipitationAmount":10.9,"precipitationChance":0.56,"precipitationType":"rain","snowfallAmount":0.00,"windDirection":48,"windSpeed":17.66}},{"forecastStart":"2023-03-22T16:00:00Z","forecastEnd":"2023-03-23T16:00:00Z","conditionCode":"Rain","maxUvIndex":5,"moonPhase":"new","moonrise":"2023-03-22T23:01:23Z","moonset":"2023-03-23T12:07:32Z","precipitationAmount":10.2,"precipitationChance":0.64,"precipitationType":"rain","snowfallAmount":0.00,"solarMidnight":"2023-03-22T16:13:48Z","solarNoon":"2023-03-23T04:13:59Z","sunrise":"2023-03-22T22:07:41Z","sunriseCivil":"2023-03-22T21:42:49Z","sunriseNautical":"2023-03-22T21:13:36Z","sunriseAstronomical":"2023-03-22T20:44:10Z","sunset":"2023-03-23T10:20:35Z","sunsetCivil":"2023-03-23T10:45:34Z","sunsetNautical":"2023-03-23T11:14:48Z","sunsetAstronomical":"2023-03-23T11:44:26Z","temperatureMax":12.68,"temperatureMin":8.94,"daytimeForecast":{"forecastStart":"2023-03-22T23:00:00Z","forecastEnd":"2023-03-23T11:00:00Z","cloudCover":0.98,"conditionCode":"Drizzle","humidity":0.68,"precipitationAmount":4.0,"precipitationChance":0.45,"precipitationType":"rain","snowfallAmount":0.00,"windDirection":32,"windSpeed":21.37},"overnightForecast":{"forecastStart":"2023-03-23T11:00:00Z","forecastEnd":"2023-03-23T23:00:00Z","cloudCover":0.94,"conditionCode":"Cloudy","humidity":0.55,"precipitationAmount":0.0,"precipitationChance":0.00,"precipitationType":"clear","snowfallAmount":0.00,"windDirection":16,"windSpeed":17.59}},{"forecastStart":"2023-03-23T16:00:00Z","forecastEnd":"2023-03-24T16:00:00Z","conditionCode":"Cloudy","maxUvIndex":5,"moonPhase":"waxingCrescent","moonrise":"2023-03-23T23:31:34Z","moonset":"2023-03-24T13:14:26Z","precipitationAmount":0.0,"precipitationChance":0.00,"precipitationType":"clear","snowfallAmount":0.00,"solarMidnight":"2023-03-23T16:13:30Z","solarNoon":"2023-03-24T04:13:41Z","sunrise":"2023-03-23T22:06:19Z","sunriseCivil":"2023-03-23T21:41:26Z","sunriseNautical":"2023-03-23T21:12:11Z","sunriseAstronomical":"2023-03-23T20:42:42Z","sunset":"2023-03-24T10:21:22Z","sunsetCivil":"2023-03-24T10:46:21Z","sunsetNautical":"2023-03-24T11:15:37Z","sunsetAstronomical":"2023-03-24T11:45:18Z","temperatureMax":14.16,"temperatureMin":6.79,"daytimeForecast":{"forecastStart":"2023-03-23T23:00:00Z","forecastEnd":"2023-03-24T11:00:00Z","cloudCover":0.90,"conditionCode":"Cloudy","humidity":0.47,"precipitationAmount":0.0,"precipitationChance":0.00,"precipitationType":"clear","snowfallAmount":0.00,"windDirection":3,"windSpeed":13.95},"overnightForecast":{"forecastStart":"2023-03-24T11:00:00Z","forecastEnd":"2023-03-24T23:00:00Z","cloudCover":0.92,"conditionCode":"Cloudy","humidity":0.60,"precipitationAmount":0.0,"precipitationChance":0.00,"precipitationType":"clear","snowfallAmount":0.00,"windDirection":352,"windSpeed":10.45}},{"forecastStart":"2023-03-24T16:00:00Z","forecastEnd":"2023-03-25T16:00:00Z","conditionCode":"MostlyCloudy","maxUvIndex":6,"moonPhase":"waxingCrescent","moonrise":"2023-03-25T00:03:39Z","moonset":"2023-03-25T14:20:30Z","precipitationAmount":0.0,"precipitationChance":0.00,"precipitationType":"clear","snowfallAmount":0.00,"solarMidnight":"2023-03-24T16:13:11Z","solarNoon":"2023-03-25T04:13:23Z","sunrise":"2023-03-24T22:04:56Z","sunriseCivil":"2023-03-24T21:40:04Z","sunriseNautical":"2023-03-24T21:10:46Z","sunriseAstronomical":"2023-03-24T20:41:14Z","sunset":"2023-03-25T10:22:07Z","sunsetCivil":"2023-03-25T10:47:08Z","sunsetNautical":"2023-03-25T11:16:26Z","sunsetAstronomical":"2023-03-25T11:46:11Z","temperatureMax":15.40,"temperatureMin":6.82,"daytimeForecast":{"forecastStart":"2023-03-24T23:00:00Z","forecastEnd":"2023-03-25T11:00:00Z","cloudCover":0.49,"conditionCode":"PartlyCloudy","humidity":0.56,"precipitationAmount":0.0,"precipitationChance":0.00,"precipitationType":"clear","snowfallAmount":0.00,"windDirection":281,"windSpeed":7.23},"overnightForecast":{"forecastStart":"2023-03-25T11:00:00Z","forecastEnd":"2023-03-25T23:00:00Z","cloudCover":0.76,"conditionCode":"MostlyCloudy","humidity":0.72,"precipitationAmount":0.0,"precipitationChance":0.00,"precipitationType":"clear","snowfallAmount":0.00,"windDirection":101,"windSpeed":10.83}},{"forecastStart":"2023-03-25T16:00:00Z","forecastEnd":"2023-03-26T16:00:00Z","conditionCode":"PartlyCloudy","maxUvIndex":6,"moonPhase":"waxingCrescent","moonrise":"2023-03-26T00:39:25Z","moonset":"2023-03-26T15:24:58Z","precipitationAmount":0.0,"precipitationChance":0.00,"precipitationType":"clear","snowfallAmount":0.00,"solarMidnight":"2023-03-25T16:12:53Z","solarNoon":"2023-03-26T04:13:04Z","sunrise":"2023-03-25T22:03:34Z","sunriseCivil":"2023-03-25T21:38:41Z","sunriseNautical":"2023-03-25T21:09:21Z","sunriseAstronomical":"2023-03-25T20:39:46Z","sunset":"2023-03-26T10:22:53Z","sunsetCivil":"2023-03-26T10:47:54Z","sunsetNautical":"2023-03-26T11:17:15Z","sunsetAstronomical":"2023-03-26T11:47:03Z","temperatureMax":16.45,"temperatureMin":5.94,"daytimeForecast":{"forecastStart":"2023-03-25T23:00:00Z","forecastEnd":"2023-03-26T11:00:00Z","cloudCover":0.46,"conditionCode":"PartlyCloudy","humidity":0.62,"precipitationAmount":0.0,"precipitationChance":0.00,"precipitationType":"clear","snowfallAmount":0.00,"windDirection":127,"windSpeed":11.97},"overnightForecast":{"forecastStart":"2023-03-26T11:00:00Z","forecastEnd":"2023-03-26T23:00:00Z","cloudCover":0.89,"conditionCode":"Cloudy","humidity":0.57,"precipitationAmount":0.0,"precipitationChance":0.00,"precipitationType":"clear","snowfallAmount":0.00,"windDirection":109,"windSpeed":11.08}}]}}
        """
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
        cancellables = Set<AnyCancellable>()
        let configuration = URLSessionConfiguration.default
        configuration.requestCachePolicy = .reloadIgnoringLocalAndRemoteCacheData
        configuration.protocolClasses = [MockURLProtocol.self]
        let urlSession = URLSession(configuration: configuration)
        
        weatherApi = WeatherApiIml(BaseUrl(), urlSession: urlSession)
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testFetchDailyWeatherSuccess() throws {
        // when
        let location = CLLocationCoordinate2D()
        let data = dailyWeatherJson.data(using: .utf8)
        
        MockURLProtocol.requestHandler = { request in
            let req = BaseUrl().getRequest(of: .fetchWeatherDaily(location.latitude, location.longitude))
            let response = HTTPURLResponse(url: req.url!, statusCode: 200, httpVersion: nil, headerFields: nil)!
            return (response, data)
        }
        
        // given
        var days = [Day]()
        var error: Error?
        let expectation = self.expectation(description: "Awaiting publisher")
        
        weatherApi
            .fetchWeatherDaily(location.latitude, location.longitude)
            .sink { completion in
                switch completion {
                case .finished:
                    break
                case .failure(let encounteredError):
                    error = encounteredError
                }

                expectation.fulfill()
            } receiveValue: { value in
                days = value
            }
            .store(in: &cancellables)
        
        waitForExpectations(timeout: 10)
        
        // then
        XCTAssertNil(error)
        XCTAssertEqual(days.count, 10)
    }

    func testFetchDailyWeatherFailure() throws {
        // when
        let location = CLLocationCoordinate2D()
        let data = "".data(using: .utf8)
        
        MockURLProtocol.requestHandler = { request in
            let req = BaseUrl().getRequest(of: .fetchWeatherDaily(location.latitude, location.longitude))
            let response = HTTPURLResponse(url: req.url!, statusCode: 401, httpVersion: nil, headerFields: nil)!
            return (response, data)
        }
        
        // given
        var error: Error?
        let expectation = self.expectation(description: "Awaiting publisher")
        weatherApi
            .fetchWeatherDaily(location.latitude, location.longitude)
            .sink { completion in
                switch completion {
                case .finished:
                    break
                case .failure(let encounteredError):
                    error = encounteredError
                }

                expectation.fulfill()
            } receiveValue: { _ in
            }
            .store(in: &cancellables)
        
        waitForExpectations(timeout: 10)
        
        // then
        XCTAssertNotNil(error)
    }
}
