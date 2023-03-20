//
//  DailyWeatherView.swift
//

import SwiftUI

struct DailyWeatherView: View {
    @EnvironmentObject private var viewModel: DailyWeatherViewModel
    @State private var showingSheet = false
    @StateObject var locationManager = LocationManager()
    @State var selectedDate  = Date()
    @State var loaded = false
    var body: some View {
        ZStack {
            Color.ui.primary
                .ignoresSafeArea()
            switch locationManager.locationManager.authorizationStatus {
            case .authorizedWhenInUse:
                if viewModel.isLoading {
                    LoadingOverlay()
                } else if viewModel.errorMessage != nil {
                    Text("Fail to load data! Error: \(viewModel.errorMessage ?? "NA")")
                    Button("Reload") {
                        if let location = locationManager.locationManager.location?.coordinate {
                            viewModel.loadDailyData(location: location)
                        }
                    }
                } else {
                    VStack(alignment: .leading) {
                        Text("10-day forecast")
                            .foregroundColor(.white)
                            .textCase(.uppercase)
                            .padding(.vertical, 10)
                        List {
                            ForEach (viewModel.days, id: \.forecastStart) { day in
                                ForecastRow(day: day) {
                                    showingSheet.toggle()
                                    self.selectedDate = day.forecastEnd
                                }
                            }//Foreach
                            .listRowBackground(Color.ui.secondary)
                        }//List
                        .onAppear(perform: {
                            UITableView.appearance().backgroundColor = .clear
                        })
                        .background(Color.ui.secondary)
                        .sheet(isPresented: $showingSheet, content: {
                            NavigationView {
                                Text("hourly")
                                    .navigationTitle(selectedDate.toString())
                                        .navigationBarItems(trailing: Button("Done",
                                                                             action: {self.showingSheet.toggle()}))
                                    }
                        })
                    }// VStack
                    .onAppear(perform: {
                        if !loaded, let location = locationManager.locationManager.location?.coordinate {
                            loaded = true
                            viewModel.loadDailyData(location: location)
                        }
                        
                    })
                    .cornerRadius(15)
                    .background(Color.ui.secondary)
                    .padding(.leading, 10)
                    .padding(.trailing, 10)
                }
            case .restricted, .denied:  // Location services currently unavailable.
                Text("Current location data was restricted or denied.")
            case .notDetermined:        // Authorization not determined yet.
                Text("Finding your location...")
                ProgressView()
            default:
                LoadingOverlay()
            }
        }//ZStack
    }//Body
}//ContentView

struct DailyWeatherView_Previews: PreviewProvider {
    static var previews: some View {
        DailyWeatherView()
    }
}
