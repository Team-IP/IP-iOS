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
    
    @State var onboardingType: OnboardingType = .login
    
    var body: some View {
        HStack {
            onboardingTypeButtonGroup
        }
        
        switch onboardingType {
        case .signup:
            SignupView()
        case .login:
            LoginView()
        }
    }
    
    var onboardingTypeButtonGroup: some View {
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
    @State var nickname: String = ""
    @State var email: String = ""
    @State var password: String = ""
    
    
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
    @State var email: String = ""
    @State var password: String = ""
    
    
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
