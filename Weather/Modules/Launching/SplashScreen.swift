//
//  ContentView.swift

//
//

import SwiftUI
import Repository

struct SplashScreen: View {
    @Environment(\.configs) var configs
    @Environment(\.router) var router
    
    var body: some View {
        ZStack {
            VStack {
                Text(configs.appName)
            }
            .padding(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/, 0)
        }
        .onAppear() {
            print("Splash Screen Appear")
        }
    }
}

struct SplashScreen_Previews: PreviewProvider {
    static var previews: some View {
        SplashScreen()
    }
}
