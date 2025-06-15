//
//  MainView.swift
//  WeatherApp
//
//  Created by Nikhil Polepalli on 6/15/25.
//

import SwiftUI

struct MainView: View{
    @Environment(AuthController.self) private var authController
    
    var body: some View{
        Group{
            switch authController.authState{
            case .undefined:
                ProgressView()
            case .authenicated:
                ContentView()
            case .notAuthenticated:
                AuthView()
            }
        }
        .task{
            await authController.startListeningToAuthState()
        }
    }
}

#Preview {
    MainView()
}
