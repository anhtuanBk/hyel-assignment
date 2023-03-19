//
//  AppShowingViewModel.swift

//
//

import Foundation
import Combine

class AppShowingViewModel: ObservableObject {
    private var bag = Set<AnyCancellable>()
    
    @Published var isLoading = false
    
    init(appShowingManager: AppShowingManager) {
        appShowingManager.globalLoadingUpdated()
            .sink { [weak self] loading in
                self?.isLoading = loading
            }
            .store(in: &bag)
    }
}
