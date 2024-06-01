//
//  Home.swift
//  IP-iOS
//
//  Created by 정정욱 on 6/1/24.
//

import SwiftUI

struct Home: View {
  
    
    var body: some View {
        
        VStack(content: {
            
            // HomeViewHeader
            ZStack(content: {
                Rectangle()
                    .frame(maxWidth: .infinity)
                    .frame(height: 200)  // 높이는 고정
                    .foregroundColor(Color(.lightGray))
                    .clipShape(
                        .rect(
                            topLeadingRadius: 0,
                            bottomLeadingRadius: 20,
                            bottomTrailingRadius: 20,
                            topTrailingRadius: 0
                        )
                    )
                
                
            })
           
        })
        
        ScrollView(.vertical) {
            LazyVStack (spacing: 20) {
                
                Text("지금 Hot🔥한 IF")
                    .font(.title)
                    .bold()
                    .padding()
                
                // 투표 Cell View
                ForEach(1...30, id: \.self) { _ in
                    VoteCell()
                        .scrollTransition(
                            // . interactive 말고도 다양한 설정 값이 있음
                            topLeading: .interactive,
                            bottomTrailing: .animated) { view, phase in
                                view
                                    .opacity(1 - (phase.value < 0 ? -phase.value : phase.value))
                            }
                           
                }
              
            }
        }
       
    }
}

// Sheet Size 더 작게 Custom
extension PresentationDetent {
    static let small = Self.height(100)
}

#Preview {
    Home()
}
