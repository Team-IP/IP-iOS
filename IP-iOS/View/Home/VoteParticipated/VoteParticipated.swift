////
////  VoteParticipated.swift
////  IP-iOS
////
////  Created by 정정욱 on 6/1/24.
////
//
//import SwiftUI
//
//struct VoteParticipated: View {
//    var body: some View {
//        ScrollView(.vertical) {
//            LazyVStack (spacing: 20) {
//                
//                Text("내가 참여한 투표")
//                    .font(.title)
//                    .bold()
//                    .padding()
//                
//                // 투표 Cell View
//                ForEach(1...30, id: \.self) { _ in
//                    VoteCell()
//                        .scrollTransition(
//                            // . interactive 말고도 다양한 설정 값이 있음
//                            topLeading: .interactive,
//                            bottomTrailing: .animated) { view, phase in
//                                view
//                                    .opacity(1 - (phase.value < 0 ? -phase.value : phase.value))
//                            }
//                           
//                }
//              
//            }
//        }
//    }
//}
//
//#Preview {
//    VoteParticipated()
//}
