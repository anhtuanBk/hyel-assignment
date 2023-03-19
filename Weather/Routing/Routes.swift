//
//  Routes.swift

//
//

import Repository
import SwiftUI

extension NavigationRouteLink {
    static var splash: NavigationRouteLink { "/splash" }
}

extension Array where Element == NavigationRoute {
    static var all: [NavigationRoute] {
        let splash = NavigationRoute(path: "/splash", destination: SplashScreen())
        return [splash]
    }
}
