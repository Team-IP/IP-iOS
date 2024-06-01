//
//  FloatingButton.swift
//  IP-iOS
//
//  Created by DOYEON LEE on 6/1/24.
//

import SwiftUI

struct FloatingButton: View {
    
    @Binding var isFloatingButtonOn: Bool
    let onTapNewVoteButton: () -> Void
    let onTapMyVoteButton: () -> Void
    
    var body: some View {
        VStack {
            if isFloatingButtonOn {
                Group {
                    Button(action: {
                        onTapNewVoteButton()
                    }) {
                        VStack(spacing: 3) {
                            Text("새 투표 만들기")
                                .setTypo(.body3)
                                .foregroundColor(.ipLine)
                            Image("plus-navy-icon")
                                .resizable()
                                .frame(width: 25, height: 25)
                                .padding()
                                .background(.ipPrimary)
                                .cornerRadius(30)
                        }
                    }
                    
                    Button(action: {
                        onTapMyVoteButton()
                    }) {
                        VStack(spacing: 3) {
                            Text("내가 만든 투표")
                                .setTypo(.body3)
                                .foregroundColor(.ipLine)
                            Image("vote-icon")
                                .resizable()
                                .frame(width: 25, height: 25)
                                .padding()
                                .background(.ipPrimary)
                                .cornerRadius((30))
                        }
                    }
                }.transition(.move(edge: .trailing))
                    .padding([.trailing], PAGE_PADDING)
            }
            
            Button(action: {
                withAnimation(.bouncy) {
                    isFloatingButtonOn.toggle()
                }
            }) {
                Image("plus-green-icon")
                    .resizable()
                    .frame(width: 25, height: 25)
                    .padding()
                    .background(.ipLine)
                    .cornerRadius(30)
            }
            .padding([.bottom, .trailing], PAGE_PADDING)
        }
    }
}
