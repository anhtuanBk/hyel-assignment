//
//  HourlyWeatherDao.swift
//  Repository
//
//  Created by henry on 20/03/2023.
//

import Foundation
import CoreLocation

public class HourlyWeatherDaoImpl: BaseDao<Hour>, HourlyWeatherDao {
    private let key = "key.hourlyWeathers"
    
    public override init(_ userDefaults: UserDefaults = UserDefaults.standard, expiredTimeInMinute: Int? = 5) {
        super.init(userDefaults, expiredTimeInMinute: expiredTimeInMinute)
    }
    
    public func getHourlyWeathers(_ lat: Double, _ lon: Double, date: Date) -> [Hour]? {
        let dynamicKey = "\(key).\(lat).\(lon).\(date.timeIntervalSince1970)"
        return getItems(key: dynamicKey)
    }
    
    public func saveHourlyWeathers(_ lat: Double, _ lon: Double, date: Date, hourlyWeathers: [Hour]) {
        let dynamicKey = "\(key).\(lat).\(lon).\(date.timeIntervalSince1970)"
        cacheItems(items: hourlyWeathers, key: dynamicKey)
    }
    
    public func clearHourlyWeathers() {
        clearCache(keyPrefix: key)
    }
}

