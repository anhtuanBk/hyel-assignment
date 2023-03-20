//
//  WeatherDaoImpl.swift
//  Repository
//
//  Created by henry on 20/03/2023.
//

import Foundation
import CoreLocation

public class DailyWeatherDaoImpl: BaseDao<Day>, DailyWeatherDao {
    private let key = "key.dailyWeathers"
    
    public override init(_ userDefaults: UserDefaults = UserDefaults.standard, expiredTimeInMinute: Int? = 5) {
        super.init(userDefaults, expiredTimeInMinute: expiredTimeInMinute)
    }
    
    public func getDailyWeathers(_ location: CLLocationCoordinate2D) -> [Day]? {
        let dynamicKey = "\(key).\(String(describing: location))"
        return getItems(key: dynamicKey)
    }
    
    public func saveDailyWeathers(_ location: CLLocationCoordinate2D, dailyWeathers: [Day]) {
        let dynamicKey = "\(key).\(String(describing: location))"
        cacheItems(items: dailyWeathers, key: dynamicKey)
    }
    
    public func clearDailyWeathers() {
        clearCache(keyPrefix: key)
    }
}
