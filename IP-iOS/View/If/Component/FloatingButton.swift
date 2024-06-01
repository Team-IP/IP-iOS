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
                        VStack {
                            Text("새 투표 만들기")
                            Text("+")
                                .font(.system(size: 24, weight: .bold))
                                .foregroundColor(.white)
                                .padding()
                                .frame(width: 50, height: 50)
                                .background(Color.blue)
                                .cornerRadius(25)
                        }
                    }
                    
                    Button(action: {
                        onTapMyVoteButton()
                    }) {
                        VStack {
                            Text("내가 만든 투표")
                            Text("+")
                                .font(.system(size: 24, weight: .bold))
                                .foregroundColor(.white)
                                .padding()
                                .frame(width: 50, height: 50)
                                .background(Color.blue)
                                .cornerRadius(25)
                        }
                    }
                }.transition(.move(edge: .trailing))
            }
            
            Button(action: {
                withAnimation(.bouncy) {
                    isFloatingButtonOn.toggle()
                }
            }) {
                Text("+")
                    .font(.system(size: 24, weight: .bold))
                    .foregroundColor(.white)
                    .padding()
                    .frame(width: 50, height: 50)
                    .background(Color.blue)
                    .cornerRadius(25)
            }
        }
    }
}
