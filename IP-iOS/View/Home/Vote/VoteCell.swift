//
//  VoteCell.swift
//  IP-iOS
//
//  Created by 정정욱 on 6/1/24.
//

import SwiftUI

struct VoteCell: View {
    var body: some View {
        ZStack(alignment: .top, content: {
            Rectangle()
                .frame(width: 330, height: 300)
                .cornerRadius(20)
                .foregroundColor(Color(.lightGray))

            VStack(content: {
                
                // 투표 질문 View
                VoteHeader()
                .padding(EdgeInsets(top: 20, leading: 60, bottom: 20, trailing: 60))
                
                
                // 투표 항목 List View
                VoteBody()
                .padding(.horizontal, 60)
                
                
            })
           
          
        })
    }
}

#Preview {
    VoteCell()
}
