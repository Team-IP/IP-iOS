//
//  MySettingView.swift
//  IP-iOS
//
//  Created by 정정욱 on 6/1/24.
//

import SwiftUI

struct MySettingView: View {
    @State var toggleIsOn: Bool = false
    @State var toggleIsOn2: Bool = false
    
    var body: some View {
        ScrollView (.vertical, showsIndicators: false) {
            VStack (spacing: 20) {
                
                
                MySettingHeader(name: "회원가입 정보")
                
                // 1. Applcation
                GroupBox {
                    // content
                    MySettingContent(name: "로그인") {
                        Text("woogie")
                    }
                    MySettingContent(name: "닉네임") {
                        Spacer()
                        HStack() {
                            Text("이즌")
                            Toggle(isOn: $toggleIsOn) {} //: Toggle
                                .toggleStyle(SwitchToggleStyle(tint: Color.green))
                                .frame(width: 50)
                            //토글 스타일 지정 선택시 색상 변경
                        }
                    }
                    MySettingContent(name: "자동로그인") {
                        Toggle(isOn: $toggleIsOn2) {} //: Toggle
                            .toggleStyle(SwitchToggleStyle(tint: Color.green))
                            .frame(width: 50)
                    }
                    
                }
                
                MySettingHeader(name: "이용약관")
                // 1. Applcation
                GroupBox {
                    // content
                    MySettingContent(name: "서비스 이용약관") {
                        EmptyView()
                    }
                    MySettingContent(name: "개인정보처리방침") {
                        EmptyView()
                    }
                    
                }
                
                
                MySettingHeader(name: "앱 정보")
                
                // 1. Applcation
                GroupBox {
                    // content
                    MySettingContent(name: "버전정보") {
                        EmptyView()
                    }
                    MySettingContent(name: "오픈소스 라이센스") {
                        EmptyView()
                    }
                    MySettingContent(name: "로그아웃") {
                        EmptyView()
                    }
                }
                
                
                
            } //: VSTACK
            .padding()
        } //: SCROLL
    }
}

#Preview {
    MySettingView()
}
