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
            VStack(alignment: .leading) {
                Text("닉네임")
                Text("sample@email.com")
                    .padding()
                    .background(.gray)
                    .cornerRadius(50)
                
                VStack {
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
                    LeafStorageView()
                default:
                    EmptyView()
                }
            }
            .frame(maxWidth: .infinity)
            .padding()
            Spacer()
        }
    }
}

#Preview {
    MypageView()
}
