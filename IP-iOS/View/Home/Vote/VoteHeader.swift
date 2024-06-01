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
//        HStack(content: {
            VStack(alignment: .leading, content: {
                HStack {
                    Text(voteViewModel.voteHeaderTitle)
                        .bold()
                        .setDefaultFont(size: 18, weight: .bold)
                    Spacer()
                    HStack(content: {
                        Image("goods-img")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 15, height: 15)
                        Text(voteViewModel.voteHeaderIPGoods)
                            .setTypo(.body3b)
                            .foregroundColor(.ipPrimary)
                    })
                }
                Text(voteViewModel.voteHeaderTimeremaining)
                    .setTypo(.body2)
                    .foregroundColor(.gray)
                
              
            })
            .frame(maxWidth: .infinity)
//        })  :HSTACK
    }
}

#Preview {
    VoteHeader(voteViewModel: VoteViewModel())
}
