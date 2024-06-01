//
//  VoteHeader.swift
//  IP-iOS
//
//  Created by 정정욱 on 6/1/24.
//

import SwiftUI

struct VoteHeader: View {
    var body: some View {
        HStack(content: {
            VStack(alignment: .leading, content: {
                Text("투표 질문")
                    .bold()
                    .font(.title2)
                Text("남은 기간, 시간")
                
              
            })
            Spacer()
            
            VStack {
                Text("🌱걸린")
                Text("잎/상품")
            }
        })  //:HSTACK
    }
}

#Preview {
    VoteHeader()
}
