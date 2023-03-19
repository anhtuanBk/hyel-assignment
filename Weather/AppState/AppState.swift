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
    
    // Manager
    func appShowingManager() -> AppShowingManager {
        return appShowingInstance
    }
}
