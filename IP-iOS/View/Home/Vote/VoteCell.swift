//
//  VoteCell.swift
//  IP-iOS
//
//  Created by 정정욱 on 6/1/24.
//

import SwiftUI

struct VoteCell: View {
    @State var showSheet: Bool = false
    
    @StateObject var voteViewModel = VoteViewModel()
      
    var body: some View {
        ZStack(alignment: .top, content: {
            Rectangle()
                .frame(width: 330, height: 280)
                .cornerRadius(20)
                .foregroundColor(Color(.white))
                .shadow(radius: 10)
            
            VStack(content: {
                
                // 투표 질문 View
                VoteHeader(voteViewModel: voteViewModel)
                    .padding(EdgeInsets(top: 20, leading: 70, bottom: 20, trailing: 70))
                
                
                // 투표 항목 List View
                VoteBody(voteViewModel: voteViewModel)
                    .padding(.horizontal, 60)
                
                
            })
            
            
        })
   
        .onTapGesture {
            showSheet.toggle()
        }
        .sheet(isPresented: $showSheet) {
            VStack {
                
                VoteDetail(voteViewModel: voteViewModel)
                    .padding(.horizontal, 30)
            }
            
            //.presentationDetents([.small, .medium, .large])
            //.presentationDragIndicator(.hidden) // sheet 맨위 상단 사각형 지우기
        }
    }
}

#Preview {
    VoteCell()
}
