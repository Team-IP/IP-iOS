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
    
    @State private var keyboardHeight: CGFloat = 0
    @State private var onboardingType: OnboardingType = .login
    
    var body: some View {
        GeometryReader { rootGeometry in
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
                
                Group {
                    switch onboardingType {
                    case .signup:
                        SignupView()
                    case .login:
                        LoginView()
                    }
                }
            }
            .background(.ipBackground)
            .addHideKeyboardGuesture()
            .offset(x: 0, y: -keyboardHeight * 0.3)
            .animation(.easeInOut, value: keyboardHeight)
            .onAppear {
                self.addKeyboardObserver()
            }
            .onDisappear {
                self.removeKeyboardObserver()
            }
        }
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
    
    // 키보드 옵저버 추가
    private func addKeyboardObserver() {
        NotificationCenter.default.addObserver(forName: UIResponder.keyboardWillShowNotification, object: nil, queue: .main) { (notification) in
            if let keyboardFrame = notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? CGRect {
                self.keyboardHeight = keyboardFrame.height
            }
        }
        NotificationCenter.default.addObserver(forName: UIResponder.keyboardWillHideNotification, object: nil, queue: .main) { (notification) in
            self.keyboardHeight = 0
        }
    }
    
    // 키보드 옵저버 제거
    private func removeKeyboardObserver() {
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillHideNotification, object: nil)
    }
}

#Preview {
    OnboardingView()
}

private struct SignupView: View {
    @State private var nickname: String = ""
    @State private var email: String = ""
    @State private var password: String = ""
    
    @State private var isModalOpen: Bool = false
    @State private var modalTitle: String = ""
    @State private var modalDescription: String = ""
    
    var body: some View {
        ZStack {
            VStack(spacing: 20) {
                Group {
                    IPTextField(placeholder: "닉네임을 입력해주세요.", text: $nickname)
                    IPTextField(placeholder: "메일주소를 입력해주세요.", text: $email)
                    IPTextField(placeholder: "비밀번호를 입력해주세요.", text: $password, isSecure: true)
                }
                
                Spacer()
                
                Button(action: {
                    signup()
                }) {
                    Text("가입하기")
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
            
            
            if isModalOpen {
                VStack {
                    Spacer()
                    Spacer()
                    VStack(spacing: 2) {
                        Text(modalTitle)
                            .setTypo(.body1b)
                        Text(modalDescription)
                            .setTypo(.body2)
                            .foregroundColor(.gray)
                    }
                    .padding(.vertical, 20)
                    .padding(.horizontal, 40)
                    .background(.ipBackground)
                    .cornerRadius(10)
                    .shadow(color: .black.opacity(0.2), radius: 20)
                    Spacer()
                }
                .animation(.bouncy, value: isModalOpen)
            }
        }
    }
    
    var checkInputCount: Bool {
        return nickname.count > 0 && email.count > 0 && password.count > 0
    }
    
    func signup() {
        let service = MemberService.shared
        
        service.signup(
            name: nickname,
            email: email,
            password: password
        ) { response in
            switch(response) {
            case .success:
                isModalOpen = true
                modalTitle = "가입이 완료되었습니다"
                modalDescription = "가입이 완료되었습니다"
            case .failure(_):
                isModalOpen = true
                modalTitle = "가입에 실패했습니다"
                modalDescription = "다시 시도해주세요"
            }
            
            print(response)
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                isModalOpen = false
            }
        }
    }
    
}

private struct LoginView: View {
    @State private var email: String = ""
    @State private var password: String = ""
    
    var body: some View {
        ZStack {
            VStack(spacing: 20) {
                Group {
                    IPTextField(placeholder: "메일주소를 입력해주세요.", text: $email)
                    IPTextField(placeholder: "비밀번호를 입력해주세요.", text: $password, isSecure: true)
                }
                
                Spacer()
                
                Button(action: {
                    login()
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
    }
    
    var checkInputCount: Bool {
        return email.count > 0 && password.count > 0
    }
    
    func login() {
        let service = MemberService.shared
        
        service.login(
            email: email,
            password: password
        ) { response in
            print(response)
            switch(response) {
            case .success(let data):
                UserDefaults.standard.setValue(
                    data.result.token,
                    forKey: "token"
                )
                print("saved token \(UserDefaults.standard.string(forKey: "token"))")
            case .failure(_):
                print("실패")
            }
            
        }
    }
}

