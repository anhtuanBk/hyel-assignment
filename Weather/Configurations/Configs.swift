//
//  Configs.swift

//
//

import Foundation
import SwiftUI

final class Configs {
    static let shared = Configs()
    let appName: String
    
    init() {
        self.appName = AppEnvironment.appName
    }
}

private struct ConfigsEnvironmentKey: EnvironmentKey {
    static var defaultValue = Configs.shared
}
 
extension EnvironmentValues {
    var configs: Configs {
        get {
            self[ConfigsEnvironmentKey.self]
        }
        
        set {
            self[ConfigsEnvironmentKey.self] = newValue
        }
    }
}
