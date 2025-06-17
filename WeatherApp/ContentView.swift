//
//  ContentView.swift
//  WeatherApp
//
//  Created by Nikhil Polepalli on 6/14/25.
//

import SwiftUI

struct ContentView: View {
    @Environment(AuthController.self) private var authController
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("")
            Button("Sign Out"){
                signOut()
            }
        }
        .padding()
    }
    
    func signOut(){
        do{
            try authController.signOut()
        } catch {
            print(error.localizedDescription)
        }
    }
}

#Preview {
    ContentView()
}
