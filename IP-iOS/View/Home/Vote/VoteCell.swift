//
//  VoteCell.swift
//  IP-iOS
//
//  Created by 정정욱 on 6/1/24.
//

import SwiftUI

struct VoteCell: View {
    
    @State var showSheet: Bool = false
    
    var body: some View {
        ZStack(alignment: .top, content: {
            Rectangle()
                .frame(width: 330, height: 250)
                .cornerRadius(20)
                .foregroundColor(Color(.white))
                .shadow(radius: 10)
            
            VStack(content: {
                
                // 투표 질문 View
                VoteHeader()
                    .padding(EdgeInsets(top: 20, leading: 70, bottom: 20, trailing: 70))
                
                
                // 투표 항목 List View
                VoteBody()
                    .padding(.horizontal, 60)
                
                
            })
            
            
        })
        .onTapGesture {
            showSheet.toggle()
        }
        .sheet(isPresented: $showSheet) {
            VStack {
                
                VoteDetail()
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
