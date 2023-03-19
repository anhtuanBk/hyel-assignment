//
//  AppShowingManager.swift

//
//

import Foundation
import Combine

public protocol AppShowingManager {
    func globalLoadingUpdated() -> AnyPublisher<Bool, Never>
    
    func showGlobalLoading()
    
    func hideGlobalLoading()
}
