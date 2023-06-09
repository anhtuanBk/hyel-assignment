//
//  ForecastRow.swift
//

import SwiftUI
import Repository

struct ForecastRow: View {
    let day: Day
    var onTap: () -> Void
    var body: some View {
        Button(action: {
            self.onTap()
        }) {
            HStack {
                Text(day.weekDays)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .foregroundColor(.white)
                Image(systemName: day.conditionCode.icon).frame(maxWidth: .infinity).foregroundColor(.white)
                HStack(alignment: .top, spacing: 1) {
                    Text(day.temperatureMinString).foregroundColor(.gray)
                    Image(systemName: "circle")
                        .foregroundColor(.gray)
                        .font(.system(size: 6, weight: .bold))
                }
                .frame(maxWidth: .infinity)
                HStack(alignment: .top, spacing: 1) {
                    Text(day.temperatureMaxString).foregroundColor(.white)
                    Image(systemName: "circle")
                        .foregroundColor(.white)
                        .font(.system(size: 6, weight: .bold))
                }
                .frame(maxWidth: .infinity)
            }
        }
    }
}
