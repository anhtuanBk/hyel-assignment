//
//  HourlyWeatherView.swift
//

import SwiftUI
import Combine

struct HourlyWeatherView: View {
    @EnvironmentObject private var viewModel: HourlyWeatherViewModel
    @StateObject var locationManager: LocationManager
    
    @Binding var selectedDate: Date
    @State var loaded = false
    
    var body: some View {
        ZStack {
            Color.ui.secondary
                .ignoresSafeArea()
            if viewModel.isLoading {
                Text("Loading data...")
                ProgressView()
            } else if viewModel.errorMessage != nil {
                Text("Fail to load data! Error: \(viewModel.errorMessage ?? "NA")")
                Button("Reload") {
                    if let location = locationManager.locationManager.location?.coordinate {
                        viewModel.loadHourlyData(location: location, date: self.selectedDate)
                    }
                }
            } else {
                VStack(alignment: .leading) {
                    List {
                        ForEach(viewModel.hours, id: \.forecastStart) { hour in
                            HStack {
                                Text(hour.hourString)
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                    .foregroundColor(.white)
                                Image(systemName: hour.conditionCode.icon).frame(maxWidth: .infinity).foregroundColor(.white)
                                HStack(alignment: .top, spacing: 1) {
                                    Text(hour.temperature.toString()).foregroundColor(.gray)
                                    Image(systemName: "circle")
                                        .foregroundColor(.gray)
                                        .font(.system(size: 6, weight: .bold))
                                }
                                .frame(maxWidth: .infinity)
                            }
                        }
                        .listRowBackground(Color.ui.secondary)
                    }
                    .onAppear(perform: {
                        UITableView.appearance().backgroundColor = .clear
                    })
                    .background(Color.ui.secondary)
                }
                .background(Color.ui.secondary)
                .onAppear {
                    if !loaded, let location = locationManager.locationManager.location?.coordinate {
                        loaded = true
                        viewModel.loadHourlyData(location: location, date: self.selectedDate)
                    }
                    
                }
            }
        }
    }
}
