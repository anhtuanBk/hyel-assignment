//
//  Date+Extension.swift

//
//

import Foundation

extension Date {
    func toShortWeekday() -> String {
        return toString("EEE")
    }
    func toHour() -> String {
        return toString("HH:mm")
    }
    func toString(_ format: String = "EEE, MMM d, yyyy") -> String {
        let dateFormater = DateFormatter()
        dateFormater.dateFormat = format
        return dateFormater.string(from: self)
    }
}
