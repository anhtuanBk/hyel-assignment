//
//  AppShowingManagerImpl.swift

//
//

import Foundation
import Combine

public class AppShowingManagerImpl: AppShowingManager {
    // state
    private let isLoadingSubject = CurrentValueSubject<Bool, Never>(false)
    
    public func globalLoadingUpdated() -> AnyPublisher<Bool, Never> {
        return isLoadingSubject.eraseToAnyPublisher()
    }
    
    public func showGlobalLoading() {
        isLoadingSubject.send(true)
    }
    
    public func hideGlobalLoading() {
        isLoadingSubject.send(false)
    }
}
