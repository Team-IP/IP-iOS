//
//  VoteDetail.swift
//  IP-iOS
//
//  Created by 정정욱 on 6/1/24.
//

import SwiftUI

struct VoteDetail: View {
    
    @ObservedObject var voteViewModel : VoteViewModel
    
    var body: some View {
        ScrollView {
            VStack {
                VoteDetailHandler(voteViewModel: voteViewModel)
                    .padding(.top, 50)
                
                VoteDetailBody(voteViewModel: voteViewModel)
                
                
            }
        }
    }
}

private struct VoteDetailHandler: View {
    @ObservedObject var voteViewModel : VoteViewModel
    
    fileprivate var body: some View {
        
        VStack(alignment:.leading){
            HStack {
                
                Text(voteViewModel.voteHeaderTitle)
                    .font(.title)
                    .bold()
                
                Spacer()
                
                Image("goods-img")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 15)
                
                Text(voteViewModel.voteHeaderIPGoods)
                    .font(.caption)
                    .bold()
            
            }
            
            Text(voteViewModel.voteHeaderTimeremaining)
                .padding(.bottom)
            
            // TexEditor 여러줄 - 긴글 의 text 를 입력할때 사용
            TextEditor(text: $voteViewModel.voteDetaildescription)
                .frame(height: 250) // 크기 설정
            //.colorMultiply(Color.gray.opacity(0.3))
        }
    }
}


private struct VoteDetailBody: View {
    
    @ObservedObject var voteViewModel : VoteViewModel
    fileprivate var body: some View {
        
        VStack(){
            
            VoteButton(voteViewModel: voteViewModel)
                .padding(.bottom)
                .frame(height: 150)
            
            HStack(content: {
                HStack {
                    Text(voteViewModel.voteBodyParticipantCount)
                        .setTypo(.body0b)
                        .bold()
                        .foregroundStyle(Color(.ipLine))
//                    Text("명 참여")
//                        .font(.body)
                }
                Button(action: {
                    
                }, label: {
                    ZStack(content: {
                        Rectangle()
                            .frame(width: 180,height: 50)
                            .foregroundColor(.ipPrimary)
                            .cornerRadius(10.0)
                        Text("투표하기")
                            .foregroundStyle(Color(.ipLine))
                        
                    })
                    
                })
            })
            
            .padding(.bottom, 50)
            
        }
        
    }
}


#Preview {
    VoteDetail(voteViewModel: VoteViewModel())
}
