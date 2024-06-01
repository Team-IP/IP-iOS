//
//  VoteBody.swift
//  IP-iOS
//
//  Created by 정정욱 on 6/1/24.
//

import SwiftUI

struct VoteBody: View {
    
   
    
    var body: some View {
        VStack(alignment:.leading, content: {
            
            VoteButton()
            
            VStack(content: {
                Text("NN 명 참여")
            })
            
            
            
        }) //:VSTACK
    }
}

#Preview {
    VoteBody()
}
