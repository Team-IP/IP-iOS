//
//  VoteButton.swift
//  IP-iOS
//
//  Created by 정정욱 on 6/2/24.
//

import SwiftUI

struct VoteButton: View {
    
    @State private var isFirstButtonSelected: Bool = false
    @State private var isSecondButtonSelected: Bool = false
    
    var body: some View {
        VStack {
            // 찬성
            Button(action: {
                isFirstButtonSelected = true
                isSecondButtonSelected = false
            }) {
                ZStack {
                    Rectangle()
                        .frame(width: UIScreen.main.bounds.width * 0.8, height: 50) // 화면 너비의 80%
                        .cornerRadius(8)
                        .foregroundColor(isFirstButtonSelected ? .ipLine : .white)
                        .cornerRadius(10)
                        .overlay(
                            RoundedRectangle(cornerRadius: 8)
                                .stroke(Color(.ipLine), lineWidth: 1)
                        )
                    
                    HStack(spacing: 30) {
                        Circle()
                            .frame(width: 35)
                            .foregroundColor(.ipPrimary)
                        Text("투표 항목")
                            .font(.headline)
                            .bold()
                            .foregroundColor(isFirstButtonSelected ? .gray : .ipLine)
                            .padding(.trailing, UIScreen.main.bounds.width * 0.4)
                           
                    }
                }
            }
            
            
            Button(action: {
                isFirstButtonSelected = false
                isSecondButtonSelected = true
            }) {
                ZStack {
                    Rectangle()
                        .frame(width: UIScreen.main.bounds.width * 0.8, height: 50) // 화면 너비의 80%
                        .cornerRadius(8)
                        .foregroundColor(isSecondButtonSelected ? .ipLine : .white)
                        .cornerRadius(10)
                        .overlay(
                            RoundedRectangle(cornerRadius: 8)
                                .stroke(Color(.ipLine), lineWidth: 1)
                        )
                    
                    HStack(spacing: 30) {
                        Circle()
                            .frame(width: 35)
                            .foregroundColor(.ipPrimary)
                        Text("투표 항목")
                            .font(.headline)
                            .bold()
                            .foregroundColor(isSecondButtonSelected ? .gray : .ipLine)
                            .padding(.trailing, UIScreen.main.bounds.width * 0.4)
                    }
                }
                
            }
        }
        
            
        
    }
}

#Preview {
    VoteButton()
}
