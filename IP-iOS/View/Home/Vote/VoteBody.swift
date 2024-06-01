//
//  VoteBody.swift
//  IP-iOS
//
//  Created by 정정욱 on 6/1/24.
//

import SwiftUI

struct VoteBody: View {
    
    @ObservedObject var voteViewModel : VoteViewModel
    
    var body: some View {
        VStack(alignment:.leading, content: {
            
            VoteButton()
            
            VStack(content: {
                Text(voteViewModel.voteBodyParticipantCount)
            })
            
            
            
        }) //:VSTACK
    }
}

#Preview {
    VoteBody(voteViewModel: VoteViewModel())
}
