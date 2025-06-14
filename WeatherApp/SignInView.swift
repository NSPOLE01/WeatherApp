//
//  SignInView.swift
//  WeatherApp
//
//  Created by Nikhil Polepalli on 6/14/25.
//

import SwiftUI
import GoogleSignIn
import GoogleSignInSwift
import FirebaseAuth

@MainActor
final class AuthenitcationViewModel: ObservableObject{
    func signInGoogle() async throws{
        guard let topVC = Utilities.shared.topViewController() else {
            throw URLError(.cannotFindHost)
        }
        let gidSignInResult = try await GIDSignIn.sharedInstance.signIn(withPresenting: topVC)
        
        guard let idToken = gidSignInResult.user.idToken?.tokenString else {
            throw URLError(.badServerResponse)
        }
        let accessToken = gidSignInResult.user.accessToken.tokenString
        let credential = GoogleAuthProvider.credential(withIDToken: idToken, accessToken: accessToken)
    }
}

struct SignInView: View {
    @State private var username = ""
    @State private var password = ""
    @StateObject private var viewModel = AuthenitcationViewModel()

    var body: some View {
        VStack(spacing: 16) {
            Spacer()
            
            Text("Sign In")
                .font(.largeTitle)
                .fontWeight(.semibold)

            TextField("Username", text: $username)
                .textFieldStyle(.roundedBorder)
                .padding(.horizontal)

            SecureField("Password", text: $password)
                .textFieldStyle(.roundedBorder)
                .padding(.horizontal)
            
            GoogleSignInButton(style: .standard) { 
                
            }

            Spacer()
        }
        .background(Color(.systemBackground))
        .edgesIgnoringSafeArea(.all)
        .navigationTitle("Sign In")
    }
}

struct SignInView_Previews: PreviewProvider {
    static var previews: some View {
        SignInView()
    }
}
