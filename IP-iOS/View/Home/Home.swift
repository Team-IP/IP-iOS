//
//  Home.swift
//  IP-iOS
//
//  Created by 정정욱 on 6/1/24.
//

import SwiftUI

struct Home: View {
  
    @State private var isHeaderVisible = true
    @State private var offset = CGSize.zero
    @StateObject var viewModel = VoteViewModel()
     
    
    var body: some View {
        VStack {
            VStack(content: {
                
                // HomeViewHeader
                HomeViewHeader()
                
               
            })
            
            ScrollView(.vertical) {
                LazyVStack (spacing: 20) {
                    
                    Text("지금 Hot🔥한 IF")
                        .font(.title)
                        .bold()
                     
                    
                    // 투표 Cell View
                    ForEach(1...30, id: \.self) { _ in
                        VoteCell(voteViewModel: viewModel)
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
            .onAppear {
                viewModel.loadSurveys()
            }
        }
        .ignoresSafeArea()
        
    }
    
  
}

// Sheet Size 더 작게 Custom
extension PresentationDetent {
    static let small = Self.height(100)
}

#Preview {
    Home()
}
