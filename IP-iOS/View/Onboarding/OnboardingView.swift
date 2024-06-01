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
        .background(.ipBackground)
    }
    
    private var onboardingTypeButtonGroup: some View {
        HStack {
            Button(action: {
                onboardingType = .signup
            }) {
                Text("회원가입")
                    .foregroundStyle(.ipBlack)
                    .setTypo(onboardingType == .signup ? .body1b : .body1)
            }
            
            Divider()
                .foregroundColor(.ipBlack)
                .frame(height: 20)
            
            Button(action: {
                onboardingType = .login
            }) {
                Text("로그인")
                    .foregroundStyle(.ipBlack)
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
        VStack(spacing: 20) {
            Group {
                IPTextField(placeholder: "닉네임을 입력해주세요.", text: $nickname)
                IPTextField(placeholder: "메일주소를 입력해주세요.", text: $email)
                IPTextField(placeholder: "비밀번호를 입력해주세요.", text: $password, isSecure: true)
            }
            
            Spacer()
            
            Button(action: {
                // Handle signup
            }) {
                Text("로그인하기")
                    .setTypo(.body1)
                    .foregroundColor(
                        checkInputCount
                        ? .ipLine
                        : .gray
                    )
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(
                        checkInputCount
                        ? .ipPrimary
                        : .gray.opacity(0.2)
                    )
                    .cornerRadius(10)
            }
            .animation(.bouncy, value: checkInputCount)
            
            Spacer()
                .frame(maxHeight: 30)
        }
        .padding(.horizontal, PAGE_PADDING)
    }
    var checkInputCount: Bool {
        return nickname.count > 0 && email.count > 0 && password.count > 0
    }
    
}

private struct LoginView: View {
    @State private var email: String = ""
    @State private var password: String = ""
    
    var body: some View {
        VStack(spacing: 20) {
            Group {
                IPTextField(placeholder: "메일주소를 입력해주세요.", text: $email)
                IPTextField(placeholder: "비밀번호를 입력해주세요.", text: $password, isSecure: true)
            }
            
            Spacer()
            
            Button(action: {
                // Handle signup
            }) {
                Text("로그인하기")
                    .setTypo(.body1)
                    .foregroundColor(
                        checkInputCount
                        ? .ipLine
                        : .gray
                    )
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(
                        checkInputCount
                        ? .ipPrimary
                        : .gray.opacity(0.2)
                    )
                    .cornerRadius(10)
            }
            .animation(.bouncy, value: checkInputCount)
            
            Spacer()
                .frame(maxHeight: 30)
        }
        .padding(.horizontal, PAGE_PADDING)
    }
    
    var checkInputCount: Bool {
        return email.count > 0 && password.count > 0
    }
    
    
}
