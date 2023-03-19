//
//  Date+Extension.swift

//
//

import Foundation

extension Date {
    func age(now: Calendar = Calendar.current) -> Int { now.dateComponents([.year], from: self, to: Date()).year! }
}
