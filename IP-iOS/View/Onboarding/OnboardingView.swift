//
//  OnboardingView.swift
//  IP-iOS
//
//  Created by DOYEON LEE on 6/1/24.
//

import SwiftUI

struct OnboardingView: View {
    enum OnboardingType {
        case signup, login
    }
    
    @State private var onboardingType: OnboardingType = .login
    
    var body: some View {
        onboardingTypeButtonGroup
        
        switch onboardingType {
        case .signup:
            SignupView()
        case .login:
            LoginView()
        }
    }
    
    private var onboardingTypeButtonGroup: some View {
        HStack {
            Button(action: {
                self.onboardingType = .signup
            }) {
                Text("Sign Up")
                    .setDefaultFont()
            }
            
            Button(action: {
                self.onboardingType = .login
            }) {
                Text("Log In")
                    .setDefaultFont()
            }
        }
    }
}

#Preview {
    OnboardingView()
}

struct SignupView: View {
    @State private var nickname: String = ""
    @State private var email: String = ""
    @State private var password: String = ""
    
    var body: some View {
        TextField("Nickname", text: $nickname)
        TextField("Email", text: $email)
        TextField("Password", text: $password)
        
        Button(action: {
            // Handle signup
        }) {
            Text("회원가입하기")
        }
    }
    
}

struct LoginView: View {
    @State private var email: String = ""
    @State private var password: String = ""
    
    
    var body: some View {
        TextField("Email", text: $email)
        TextField("Password", text: $password)
        
        Button(action: {
            // Handle signup
        }) {
            Text("로그인하기")
        }
    }
    
}
