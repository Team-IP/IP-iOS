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
                        .cornerRadius(18)
                        .foregroundColor(.ipLine)
                    
                    Rectangle()
                        .foregroundColor(isFirstButtonSelected ? .ipLine : .white)
                        .frame(width: 278, height: 45)
                        .cornerRadius(18)
                    
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
                        .cornerRadius(18)
                        .foregroundColor(.ipLine)
                    
                    Rectangle()
                        .foregroundColor(isSecondButtonSelected ? .ipLine : .white)
                        .frame(width: 278, height: 45)
                        .cornerRadius(18)
                    
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
            
            VStack(content: {
                Text("NN 명 참여")
            })
            
            
            
        }) //:VSTACK
    }
}

#Preview {
    VoteBody()
}
