//
//  WeatherAppApp.swift
//  WeatherApp
//
//  Created by Nikhil Polepalli on 6/14/25.
//

import SwiftUI
import FirebaseCore


//class AppDelegate: NSObject, UIApplicationDelegate {
//  func application(_ application: UIApplication,
//                   didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
//    FirebaseApp.configure()
//
//    return true
//  }
//}

@main
struct WeatherAppApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    @State private var authController = AuthController()
    var body: some Scene {
        WindowGroup {
            MainView().environment(authController)
        }
    }
}
