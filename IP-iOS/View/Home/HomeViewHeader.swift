//
//  HomeViewHeader.swift
//  IP-iOS
//
//  Created by 정정욱 on 6/2/24.
//

import SwiftUI

struct HomeViewHeader: View {
    var body: some View {
        ZStack(content: {
            Rectangle()
                .frame(maxWidth: .infinity)
                .frame(height: 200)  // 높이는 고정
                .foregroundColor(Color(.ipLine))
                .clipShape(
                    .rect(
                        topLeadingRadius: 0,
                        bottomLeadingRadius: 20,
                        bottomTrailingRadius: 20,
                        topTrailingRadius: 0
                    )
                )
            
            VStack(content: {
                HStack{
                    Image("logo-color")
                        .resizable()  // 이미지 크기 조절 가능하도록 설정
                        .scaledToFit()  // 이미지 비율 유지하면서 크기 조정
                        .frame(width: 50, height: 50)  // 원하는 크기로 설정
                    
                    Spacer()
                    Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                        Image(systemName: "gearshape")
                            .resizable()  // 이미지 크기 조절 가능하도록 설정
                            .scaledToFit()  // 이미지 비율 유지하면서 크기 조정
                            .frame(width: 30, height: 30)  // 원하는 크기로 설정
                            .foregroundColor(.white)  // 이미지 색상 설정
                        
                    })
                    
                }
                .padding(.horizontal, 30)
                .padding(.bottom)
                
                
                HStack(spacing: 120){
                    VStack(alignment: .leading ,content: {
                        Text("내가 참여한 투표")
                            .foregroundStyle(Color.white)
                            .fixedSize(horizontal: true, vertical: false)
                        Text("NN 개")
                            .foregroundStyle(Color.white)
                            .font(.title)
                            .fixedSize(horizontal: true, vertical: false)
                    })
                    
                    
                    VStack(alignment: .trailing ,content: {
                        Text("지금 로그인 하면")
                            .foregroundStyle(Color.white)
                            .fixedSize(horizontal: true, vertical: false)
                        Text("10잎 증정!")
                            .foregroundStyle(Color.white)
                            .fixedSize(horizontal: true, vertical: false)
                        
                    })
                    
                }
                .padding(.horizontal, 30)
            })  //:VSTACK
            
        }) //:ZSTACK
    }
}

#Preview {
    HomeViewHeader()
}
