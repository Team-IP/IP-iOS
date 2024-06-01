//
//  VoteBody.swift
//  IP-iOS
//
//  Created by 정정욱 on 6/1/24.
//

import SwiftUI

struct VoteBody: View {
    
    @State private var isFirstButtonSelected: Bool = false
    @State private var isSecondButtonSelected: Bool = false
    
    
    var body: some View {
        VStack(alignment:.leading, content: {
            
            // 찬성
            Button(action: {
                isFirstButtonSelected = true
                isSecondButtonSelected = false
            }) {
                ZStack {
                    Rectangle()
                        .frame(width: 280, height: 50)
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
                            .padding(.trailing, 110)
                    }
                }
            }
            
            
            Button(action: {
                isFirstButtonSelected = false
                isSecondButtonSelected = true
            }) {
                ZStack {
                    Rectangle()
                        .frame(width: 280, height: 50)
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
                            .padding(.trailing, 110)
                    }
                }
                
                
            }
            
            VStack(content: {
                Text("NN 명 참여")
            })
            
            
            
        }) //:VSTACK
    }
}

#Preview {
    VoteBody()
}
