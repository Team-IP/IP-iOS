//
//  VoteBody.swift
//  IP-iOS
//
//  Created by 정정욱 on 6/1/24.
//

import SwiftUI

struct VoteBody: View {
    var body: some View {
        VStack(alignment: .leading,content: {
            
            // 찬성
            Button {
                
            } label: {
                HStack(content: {
                    Image(systemName: "figure.wave")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 30, height: 30)
                                    .cornerRadius(150)
                    Text("투표 항목")
                    Spacer()
                })
                
            }
            
            // 반대
            Button {
                
            } label: {
                HStack(content: {
                    Image(systemName: "figure.wave")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 30, height: 30)
                                    .cornerRadius(150)
                    Text("투표 항목")
                    Spacer()
                })
                
            }
            
            Text("투표에 참여한 사람")
                .padding(.top)
            
        }) //:VSTACK
    }
}

#Preview {
    VoteBody()
}
