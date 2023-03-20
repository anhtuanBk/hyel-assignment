//
//  AppState.swift

//
//

import Foundation

public class AppState {
    public static let shared = AppState()
    
    private lazy var appShowingInstance: AppShowingManager = {
        AppShowingManagerImpl()
    }()
    
    private lazy var locationManagerInstance: LocationManager = {
        LocationManager()
    }()
    
    // Manager
    func appShowingManager() -> AppShowingManager {
        return appShowingInstance
    }
    
    func locationManager() -> LocationManager {
        return locationManagerInstance
    }
}
