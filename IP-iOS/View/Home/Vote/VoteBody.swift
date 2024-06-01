//
//  VoteBody.swift
//  IP-iOS
//
//  Created by 정정욱 on 6/1/24.
//

import SwiftUI

struct VoteBody: View {
    
    var onTap: (() -> Void)?
    @ObservedObject var voteViewModel : VoteViewModel
    
    var body: some View {
        VStack(alignment:.leading, content: {
            
            VStack {
                
                VoteButton(onTap: onTap, voteViewModel: voteViewModel)
            }
            
            VStack(content: {
                HStack {
                    Spacer()
                    Text("\(voteViewModel.voteBodyParticipantCount)")
                        .setDefaultFont(size: 13, weight: .regular)
                        .foregroundColor(.gray)
                }
            })
            .padding(.horizontal, 15)
            
            
            
        }) //:VSTACK
    }
}

#Preview {
    VoteBody(voteViewModel: VoteViewModel())
}
