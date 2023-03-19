//
//  WeatherApp.swift
//  WeatherApp
//
//

import SwiftUI

@main
struct WeatherApp: App {
    var body: some Scene {
        WindowGroup {
            AppShowing()
                .provideViewModel(
                    create: { AppShowingViewModel(
                        appShowingManager: AppState.shared.appShowingManager()
                    )}
                )
        }
    }
}
