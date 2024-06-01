//
//  VoteButton.swift
//  IP-iOS
//
//  Created by 정정욱 on 6/2/24.
//

import SwiftUI

struct VoteButton: View {
    
    @ObservedObject var voteViewModel : VoteViewModel
    
  
    
    var body: some View {
        VStack {
            // 찬성
            Button(action: {
                voteViewModel.isFirstButtonSelected = true
                voteViewModel.isSecondButtonSelected = false
            }) {
                ZStack {
                    Rectangle()
                        .frame(width: UIScreen.main.bounds.width * 0.8, height: 50) // 화면 너비의 80%
                        .cornerRadius(8)
                        .foregroundColor( voteViewModel.isFirstButtonSelected ? .ipLine : .white)
                        .cornerRadius(10)
                        .overlay(
                            RoundedRectangle(cornerRadius: 8)
                                .stroke(Color(.ipLine), lineWidth: 1)
                        )
                    
                    HStack(spacing: 30) {
                        Circle()
                            .frame(width: 35)
                            .foregroundColor(.ipPrimary)
                        Text(voteViewModel.voteChoiceFirst)
                            .font(.headline)
                            .bold()
                            .foregroundColor( voteViewModel.isFirstButtonSelected ? .gray : .ipLine)
                            .padding(.trailing, UIScreen.main.bounds.width * 0.4)
                           
                    }
                }
            }
            
            
            Button(action: {
                voteViewModel.isFirstButtonSelected = false
                voteViewModel.isSecondButtonSelected = true
            }) {
                ZStack {
                    Rectangle()
                        .frame(width: UIScreen.main.bounds.width * 0.8, height: 50) // 화면 너비의 80%
                        .cornerRadius(8)
                        .foregroundColor( voteViewModel.isSecondButtonSelected ? .ipLine : .white)
                        .cornerRadius(10)
                        .overlay(
                            RoundedRectangle(cornerRadius: 8)
                                .stroke(Color(.ipLine), lineWidth: 1)
                        )
                    
                    HStack(spacing: 30) {
                        Circle()
                            .frame(width: 35)
                            .foregroundColor(.ipPrimary)
                        Text(voteViewModel.voteChoiceSecond)
                            .font(.headline)
                            .bold()
                            .foregroundColor( voteViewModel.isSecondButtonSelected ? .gray : .ipLine)
                            .padding(.trailing, UIScreen.main.bounds.width * 0.4)
                    }
                }
                
            }
        }
        
            
        
    }
}

#Preview {
    VoteButton(voteViewModel: VoteViewModel())
}
