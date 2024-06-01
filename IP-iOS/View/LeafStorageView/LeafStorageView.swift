//
//  LeafStorageView.swift
//  IP-iOS
//
//  Created by DOYEON LEE on 6/1/24.
//

import SwiftUI

struct LeafStorageView: View {
    
    @Binding var path: NavigationPath
    @State private var leaf: Int = 200
    @State private var spentLeaf: Int = 400
    
    var body: some View {
        ScrollView {
            VStack {
                Spacer().frame(maxHeight: 20)
                HStack{
                    Spacer()
                    VStack {
                        Text("남은 잎")
                            .setTypo(.body2b)
                            .foregroundColor(.gray)
                        HStack(spacing: 2) {
                            Text("\(leaf)")
                                .setTypo(.body1b)
                                .foregroundColor(.ipPrimary)
                            Text("잎")
                                .setTypo(.body1b)
                                .foregroundColor(.ipBlack)
                        }
                    }
                    
                    Spacer()
                    Divider()
                    Spacer()
                    
                    VStack {
                        Text("사용한 잎")
                            .setTypo(.body2b)
                            .foregroundColor(.gray)
                        HStack(spacing: 2) {
                            Text("\(spentLeaf)")
                                .setTypo(.body1b)
                                .foregroundColor(.ipPrimary)
                            Text("잎")
                                .setTypo(.body1b)
                                .foregroundColor(.ipBlack)
                        }
                    }
                    Spacer()
                }
                .frame(maxWidth: .infinity)
                .padding()
                .background(.ipPrimary.opacity(0.1))
                .cornerRadius(10)
                .overlay(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(.ipPrimary, lineWidth: 1)
                )
                .padding(.horizontal, PAGE_PADDING)
                
                Spacer()
                    .frame(minHeight: 30, maxHeight: 50)
                
                VStack(spacing: 17) {
                    LeafSellRow(leafCount: 100, price: nil)
                    LeafSellRow(leafCount: 10, price: 1000)
                    LeafSellRow(leafCount: 30, price: 2900)
                    LeafSellRow(leafCount: 50, price: 4900)
                    LeafSellRow(leafCount: 100, price: 9900)
                }
                .padding(.horizontal, PAGE_PADDING)
                
                VStack(alignment: .leading, spacing: 7) {
                    Text("친구한테 공유하고 50잎 받아가자 🔥")
                        .setTypo(.body1b)
                    Button(action: {
                        
                    }) {
                        Text("이프 다운로드 링크 공유하기")
                            .setTypo(.body2b)
                            .foregroundColor(.white)
                            .padding(.vertical, 7)
                            .padding(.horizontal, 15)
                            .frame(maxWidth: .infinity)
                            .background(.ipLine)
                            .cornerRadius(100)
                    }
                }
                .frame(maxWidth: .infinity, minHeight: 100)
                .padding(.horizontal, 20)
                .background(.ipPrimary.opacity(0.7))
                .cornerRadius(10)
                .padding(.horizontal, PAGE_PADDING)
                .padding(.vertical, 10)
                
                LeafSellRow(leafCount: 200, price: 12900)
                    .padding(.horizontal, PAGE_PADDING)
            }
        }
        .background(.ipBackground)
        .navigationTitle("잎 저장소")
        .customBackButton(dismissAction: { path.removeLast()
        })
        
    }
}

#Preview {
    LeafStorageView(path: .constant(NavigationPath()))
}
