//
//  VoteCell.swift
//  IP-iOS
//
//  Created by 정정욱 on 6/1/24.
//

import SwiftUI

struct VoteCell: View {
    
    @State var showSheet: Bool = false
    
    @ObservedObject var voteViewModel: VoteViewModel
    
    var body: some View {
        ZStack(alignment: .top, content: {

            VStack{
                
                // 투표 질문 View
                VoteHeader(voteViewModel: voteViewModel)
                    .padding(.horizontal, 25)
                
                
                // 투표 항목 List View
                VoteBody(voteViewModel: voteViewModel)
//                    .padding(.horizontal, 60)
                
                
            }
            .frame(width: 330, height: 260)
            .background(Color(.white))
            .cornerRadius(20)
            .shadow(color: .black.opacity(0.1), radius: 15)
            .padding(.horizontal, 15)
        
            
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
    VoteCell(voteViewModel: VoteViewModel())
}
