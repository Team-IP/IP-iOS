//
//  VoteViewModel.swift
//  IP-iOS
//
//  Created by 정정욱 on 6/2/24.
//

import Foundation

class VoteViewModel: ObservableObject {
    
    @Published var isLoading: Bool = false
    @Published var voteHeaderTitle: String = "썸남한테 고백할까 말까"
    @Published var voteHeaderTimeremaining: String = "2024-06-02까지 참여해보세요🔥"
    //@Published var voteHeaderIPcount: String = "🌱"
    @Published var voteHeaderIPGoods: String = "걸린잎"
    @Published var voteBodyParticipantCount: String = "3870"
    @Published var voteDetaildescription: String = "두 주 전에 만난 남자인 친구와 함께 몇 번의 모임을 가지면서 서로의 취미와 관심사를 공유하게 되었습니다. 그러던 중, 친구가 최근에 연애 상담을 요청하며 다른 사람에게 호감을 가지고 있다고 말했습니다. 그 순간, 당신은 그 친구에게 호감을 느끼고 있음을 깨닫게 되었고, 그가 말한 사람이 혹시 자신일지도 모른다는 희망을 품게 되었습니다. 하지만 만약 그가 다른 사람을 좋아한다면 고백이 친구 관계를 망칠까 봐 고민하게 됩니다."
    
    @Published var voteChoiceFirst: String = "계속 만난다."
    @Published var voteChoiceSecond: String = "그만 만난다."

    @Published var isFirstButtonSelected: Bool = false
    @Published var isSecondButtonSelected: Bool = false
    
    // init
    init(
        isLoading: Bool = false,
        voteHeaderTitle: String = "썸남한테 고백할까 말까",
        voteHeaderTimeremaining: String = "2024-06-02까지 참여해보세요🔥",
        //voteHeaderIPcount: String = "🌱",
        voteHeaderIPGoods: String = "걸린잎",
        voteBodyParticipantCount: String = "3870",
        voteDetaildescription: String = "두 주 전에 만난 남자인 친구와 함께 몇 번의 모임을 가지면서 서로의 취미와 관심사를 공유하게 되었습니다. 그러던 중, 친구가 최근에 연애 상담을 요청하며 다른 사람에게 호감을 가지고 있다고 말했습니다. 그 순간, 당신은 그 친구에게 호감을 느끼고 있음을 깨닫게 되었고, 그가 말한 사람이 혹시 자신일지도 모른다는 희망을 품게 되었습니다. 하지만 만약 그가 다른 사람을 좋아한다면 고백이 친구 관계를 망칠까 봐 고민하게 됩니다.",
        voteChoiceFirst: String = "계속 만난다.",
        voteChoiceSecond: String = "그만 만난다.",
        isFirstButtonSelected: Bool = false,
        isSecondButtonSelected: Bool = false
    ) {
        self.isLoading = isLoading
        self.voteHeaderTitle = voteHeaderTitle
        self.voteHeaderTimeremaining = voteHeaderTimeremaining
        //self.voteHeaderIPcount = voteHeaderIPcount
        self.voteHeaderIPGoods = voteHeaderIPGoods
        self.voteBodyParticipantCount = voteBodyParticipantCount
        self.voteDetaildescription = voteDetaildescription
        self.voteChoiceFirst = voteChoiceFirst
        self.voteChoiceSecond = voteChoiceSecond
        self.isFirstButtonSelected = isFirstButtonSelected
        self.isSecondButtonSelected = isSecondButtonSelected
    }
    
    @Published var voteModels: [VoteModel] = []
    @Published var errorMessage: String?
    
    func loadSurveys() {
        print("loadSurveys")
        HomeService.shared.fetchSurveys { result in
            switch result {
            case .success(let voteModels):
                DispatchQueue.main.async {
                    self.voteModels = voteModels
                    print(voteModels)
                    print("loadSurveys success")
                }
            case .failure(let error):
                DispatchQueue.main.async {
                    self.errorMessage = error.localizedDescription
                    print("loadSurveys failure")
                }
            }
        }
    }
    
}
