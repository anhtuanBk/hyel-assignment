//
//  AppShowing.swift

//
//

import SwiftUI

struct AppShowing: View {
    @EnvironmentObject private var viewModel: AppShowingViewModel
    
    let router = NavigationRouter(routes: .all)
    
    var content: some View {
        NavigationView {
            RouterView(
                router: router,
                root: .dailyWeather
            )
        }
        .environment(\.router, router)
        .navigationViewStyle(StackNavigationViewStyle())
    }
    
    var body: some View {
        if viewModel.isLoading {
            content.overlay(LoadingOverlay())
        } else {
            content
        }
    }
}

struct AppShowing_Previews: PreviewProvider {
    static var previews: some View {
        AppShowing()
            .provideViewModel {
                AppShowingViewModel(appShowingManager: AppState.shared.appShowingManager())
            }
    }
}
