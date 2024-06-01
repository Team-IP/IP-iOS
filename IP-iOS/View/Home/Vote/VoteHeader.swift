//
//  VoteHeader.swift
//  IP-iOS
//
//  Created by 정정욱 on 6/1/24.
//

import SwiftUI

struct VoteHeader: View {
    @ObservedObject var voteViewModel : VoteViewModel
    
    var body: some View {
        HStack(content: {
            VStack(alignment: .leading, content: {
                Text(voteViewModel.voteHeaderTitle)
                    .bold()
                    .font(.title2)
                Text(voteViewModel.voteHeaderTimeremaining)
                
              
            })
            Spacer()
            
            VStack {
                HStack(content: {
                    Image("goods-img")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 20)
                    Text(voteViewModel.voteHeaderIPGoods)
                        .font(.caption)
                })
               
                
            }
        })  //:HSTACK
    }
}

#Preview {
    VoteHeader(voteViewModel: VoteViewModel())
}
