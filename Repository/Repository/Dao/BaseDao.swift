//
//  BaseDao.swift
//  Repository
//
//

import Foundation

public class BaseDao<T: Codable> {
    private var userDefaults: UserDefaults
    private var expiredTimeInMinute: Int?
    
    public init(_ userDefaults: UserDefaults, expiredTimeInMinute: Int? = nil) {
        self.userDefaults = userDefaults
        self.expiredTimeInMinute = expiredTimeInMinute
    }
    
    public func cacheItems(items: [T], key: String, now: Date = Date()) {
        let encoder = JSONEncoder()
        if let encoded = try? encoder.encode(items) {
            userDefaults.setValue(encoded, forKey: key)
            userDefaults.setValue(Date(), forKey: "\(key).lastUpdated")
        }
    }
    
    public func getItems(key: String, now: Date = Date()) -> [T]? {
        if let data = userDefaults.data(forKey: key) {
            if let lastUpdated = userDefaults.object(forKey: "\(key).lastUpdated") as? Date, let expiredTime = expiredTimeInMinute {
                if let minute = Calendar.current.dateComponents([.minute], from: lastUpdated, to: now).minute, minute > expiredTime {
                    return nil
                }
            }
            let decoder = JSONDecoder()
            if let items = try? decoder.decode([T].self, from: data) {
                return items
            }
        }
        return nil
    }
    
    public func clearCache(key: String) {
        userDefaults.removeObject(forKey: key)
        userDefaults.removeObject(forKey: "\(key).lastUpdated")
    }
    
    public func clearCache(keyPrefix: String) {
        userDefaults
            .dictionaryRepresentation()
            .keys
            .filter { key in
                key.hasPrefix(keyPrefix)
            }
            .forEach { key in
                userDefaults.removeObject(forKey: key)
                userDefaults.removeObject(forKey: "\(key).lastUpdated")
            }
    }
}
