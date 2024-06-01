//
//  VoteViewModel.swift
//  IP-iOS
//
//  Created by 정정욱 on 6/2/24.
//

import Foundation

class VoteViewModel: ObservableObject {
    
    @Published var isLoading: Bool = false
    @Published var voteHeaderTitle: String = "투표 질문"
    @Published var voteHeaderTimeremaining: String = "남은 기간, 시간"
    @Published var voteHeaderIPcount: String = "🌱걸린"
    @Published var voteHeaderIPGoods: String = "잎/상품"
    @Published var voteBodyParticipantCount: String = "NN 명 참여"
   
    
    // init
    init() {
        //getFruit() // 뷰 모델 실행될때 배열에 값 추가, onAppear보다 init사용해서 초기화 하는게 좀더 확실하게 뷰에 표시할수 있음
    }
    
    
}
