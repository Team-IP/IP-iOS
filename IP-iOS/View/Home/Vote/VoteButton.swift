//
//  VoteButton.swift
//  IP-iOS
//
//  Created by 정정욱 on 6/2/24.
//

import SwiftUI

struct VoteButton: View {
    
    var onTap: (() -> Void)?
    @ObservedObject var voteViewModel : VoteViewModel
    
  
    
    var body: some View {
        VStack(alignment: .center) {
            // 찬성
            Button(action: {
                onTap?()
                voteViewModel.isFirstButtonSelected = true
                voteViewModel.isSecondButtonSelected = false
            }) {
                ZStack(alignment: .center) {
                    Rectangle()
                        .frame(maxHeight: 50) // 화면 너비의 80%
                        .cornerRadius(8)
                        .foregroundColor( voteViewModel.isFirstButtonSelected ? .ipLine : .white)
                        .cornerRadius(10)
                        .overlay(
                            RoundedRectangle(cornerRadius: 8)
                                .stroke(Color(.ipLine), lineWidth: 1)
                        )
                    
                    HStack(spacing: 24) {
//                        Circle()
//                            .frame(width: 35)
//                            .foregroundColor(.ipPrimary)
                        Image("voteSelect1")
                            .renderingMode(.template)
                            .resizable()  // 이미지 크기 조절 가능하도록 설정
                            .scaledToFit()  // 이미지 비율 유지하면서 크기 조정
                            .foregroundColor(voteViewModel.isFirstButtonSelected ? .white : .ipLine)
                            .frame(width: 30, height: 30)
                            .padding(.leading, 15)
                        Text(voteViewModel.voteChoiceFirst)
                            .font(.headline)
                            .bold()
                            .foregroundColor( voteViewModel.isFirstButtonSelected ? .white : .ipLine)
                            .padding(.trailing)
                        Spacer()
                    }
                    .frame(maxWidth: 300, maxHeight: 50)
                }
            }
            
            
            Button(action: {
                onTap?()
                voteViewModel.isFirstButtonSelected = false
                voteViewModel.isSecondButtonSelected = true
            }) {
                ZStack {
                    Rectangle()
                        .frame(maxHeight: 50) // 화면 너비의 80%
                        .cornerRadius(8)
                        .foregroundColor( voteViewModel.isSecondButtonSelected ? .ipLine : .white)
                        .cornerRadius(10)
                        .overlay(
                            RoundedRectangle(cornerRadius: 8)
                                .stroke(Color(.ipLine), lineWidth: 1)
                        )
                    
                    HStack(spacing: 24) {
                        Image("voteSelect2")
                            .renderingMode(.template)
                            .resizable()  // 이미지 크기 조절 가능하도록 설정
                            .scaledToFit()  // 이미지 비율 유지하면서 크기 조정
                            .foregroundColor(voteViewModel.isSecondButtonSelected ? .white : .ipLine)
                            .frame(width: 30, height: 30)
                            .padding(.leading, 15)
                        Text(voteViewModel.voteChoiceSecond)
                            .font(.headline)
                            .bold()
                            .foregroundColor( voteViewModel.isSecondButtonSelected ? .white : .ipLine)
                            .padding(.trailing)
                        Spacer()
                    }
                    .frame(maxWidth: 300, maxHeight: 50)
                }
                
            }
        }
        .padding(.horizontal, 25)
    }
}

#Preview {
    VoteButton(voteViewModel: VoteViewModel())
}
