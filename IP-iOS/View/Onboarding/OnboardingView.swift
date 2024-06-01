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
        VStack {
            Spacer()
                .frame(height: 120)
            
            Image("logo-color")
            
            Spacer()
                .frame(height: 30)
            
            onboardingTypeButtonGroup
            
            Spacer()
                .frame(height: 30)
            
            Spacer()
            
            switch onboardingType {
            case .signup:
                SignupView()
            case .login:
                LoginView()
            }
        }
    }
    
    private var onboardingTypeButtonGroup: some View {
        HStack {
            Button(action: {
                onboardingType = .signup
            }) {
                Text("회원가입")
                    .foregroundStyle(.black)
                    .setTypo(onboardingType == .signup ? .body1b : .body1)
            }
            
            Divider()
                .frame(height: 20)
            
            Button(action: {
                onboardingType = .login
            }) {
                Text("로그인")
                    .foregroundStyle(.black)
                    .setTypo(onboardingType == .login ? .body1b : .body1)
            }
        }
    }
}

#Preview {
    OnboardingView()
}

private struct SignupView: View {
    @State private var nickname: String = ""
    @State private var email: String = ""
    @State private var password: String = ""
    
    var body: some View {
        VStack {
            Group {
                IPTextField(placeholder: "닉네임을 입력해주세요.", text: $nickname)
                IPTextField(placeholder: "메일주소를 입력해주세요.", text: $email)
                IPTextField(placeholder: "비밀번호를 입력해주세요.", text: $password, isSecure: true)
            }
            .padding(.horizontal, PAGE_PADDING)
            
            Spacer()
            
            Button(action: {
                // Handle signup
            }) {
                Text("회원가입하기")
                    .frame(width: .infinity)
                    .padding()
                    .background(.ipPrimary)
            }
        }
    }
    
}

private struct LoginView: View {
    @State private var email: String = ""
    @State private var password: String = ""
    
    
    var body: some View {
        VStack {
            Group {
                IPTextField(placeholder: "메일주소를 입력해주세요.", text: $email)
                IPTextField(placeholder: "비밀번호를 입력해주세요.", text: $password, isSecure: true)
            }
            .padding(.horizontal, PAGE_PADDING)
            
            Spacer()
            
            Button(action: {
                // Handle signup
            }) {
                Text("로그인하기")
            }
        }
    }
    
}
