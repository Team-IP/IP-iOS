//
//  PurchaseView.swift
//  IP-iOS
//
//  Created by DOYEON LEE on 6/1/24.
//

import SwiftUI

struct MypageView: View {
    
    @State var path = NavigationPath([String]())
    
    var body: some View {
        NavigationStack(path: $path) {
            ZStack {
                VStack {
                    Spacer()
                    HStack {
                        Spacer()
                        Image("mypage-background-image")
                            .opacity(0.2)
                    }
                }
                
                VStack {
                    VStack(alignment: .leading, spacing: 12) {
                        IfTopBar(path: $path)
                        Group {
                            Text("춤추는 알로에")
                                .setTypo(.body0b)
                            HStack {
                                Text(verbatim: "sample@email.com")
                                    .setTypo(.body3)
                                    .foregroundColor(.ipLine)
                                    .padding(.horizontal, 15)
                                    .padding(.vertical, 8)
                                    .background(.ipPrimary.opacity(0.9))
                                    .cornerRadius(10)
                                Image("pen-icon")
                                    .renderingMode(.template)
                                    .foregroundColor(.gray)
                            }
                        }
                        .padding(.horizontal, PAGE_PADDING)
                        
                        Spacer()
                            .frame(maxHeight: 20)
                        
                        VStack {
                            Divider()
                            MenuRow(menuName: "잎 저장소")
                                .onTapGesture {
                                    path.append("잎 저장소")
                                }
                            
                            MenuRow(menuName: "내가 참여한 투표")
                            MenuRow(menuName: "내가 업로드한 투표")
                        }
                    }
                    .navigationDestination(for: String.self) { value in
                        switch (value) {
                        case "잎 저장소":
                            LeafStorageView(path: $path)
                        default:
                            EmptyView()
                        }
                    }
                    .frame(maxWidth: .infinity)
                    
                    Spacer()
                        
                }
            }
            .background(.ipBackground)
        }

    }
}

#Preview {
    MypageView()
}
