//
//  Home.swift
//  IP-iOS
//
//  Created by 정정욱 on 6/1/24.
//

import SwiftUI

struct Home: View {
    @State var path = NavigationPath([String]())
    
    @AppStorage("token") var token: String?
    @State var isOpenSheet = false
    
    @State private var isHeaderVisible = true
    @State private var offset = CGSize.zero
    
    @State private var isRefreshing: Bool = false
    @State private var ifCategories: [IfCategoryDTO] = []
    @State private var pageNumber: Int = 0
    @StateObject var viewModel = VoteViewModel()
    
    var body: some View {
        NavigationStack(path: $path) {
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
                            .padding()
                        
                        // 투표 Cell View
                        ForEach(ifCategories) { item in
                            VoteCell(onTap: {
                                print("tap tap")
                                if let token = token {
                                    print("로그인 상태")
                                } else {
                                    isOpenSheet = true
                                }
                            }, voteViewModel: VoteViewModel(
                                isLoading: true,
                                voteHeaderTitle: item.title,
                                voteHeaderTimeremaining: "2024-07-01까지 참여해보세요🔥",
                                voteHeaderIPGoods: "\(item.ipAmount ?? 0)잎",
                                voteBodyParticipantCount: "\(item.voteCount)명 참여",
                                voteDetaildescription: item.content ?? "",
                                voteChoiceFirst: item.firstOption,
                                voteChoiceSecond: item.secondOption,
                                isFirstButtonSelected: true,
                                isSecondButtonSelected: false
                                
                            )
                                     )
                            .scrollTransition(
                                // . interactive 말고도 다양한 설정 값이 있음
                                topLeading: .interactive,
                                bottomTrailing: .animated) { view, phase in
                                    view
                                        .opacity(1 - (phase.value < 0 ? -phase.value : phase.value))
                                }
                                .onAppear {
                                    if item == ifCategories.last {
                                        Task {
                                            await loadMoreData()
                                        }
                                    }
                                }
                        }
                    }
                }
                .onAppear() {
                    
                    pageNumber = 0
                    Task {
                        await refreshData()
                    }
                }
                .onChange(of: token) { newValue in
                    if newValue != nil {
                        isOpenSheet = false
                    }
                }
                .navigationDestination(for: String.self) { value in
                    switch (value) {
                    case "로그인":
                        OnboardingView()
                    default:
                        EmptyView()
                    }
                }
                .fullScreenCover(isPresented: $isOpenSheet) {
                    OnboardingView()
                }
                
            }
            .ignoresSafeArea()
        }
        
    }
    
    private func refreshData() async {
        // 데이터 새로고침 로직
        isRefreshing = true
        
        do {
            let fetchedCategories = try await IfCategoryService.shared.fetch(
                category: nil,
                pageNumber: "\(pageNumber)"
            )
            print(fetchedCategories)
            self.ifCategories = fetchedCategories
            pageNumber += 1
        } catch {
            print(error)
        }
        
        isRefreshing = false
    }
    
    private func loadMoreData() async {
        guard !isRefreshing else { return }
        isRefreshing = true
        do {
            let fetchedCategories = try await IfCategoryService.shared.fetch(
                category: nil,
                pageNumber: "\(pageNumber)"
            )
            print(fetchedCategories)
            self.ifCategories.append(contentsOf: fetchedCategories)
            pageNumber += 1
        } catch {
            print(error)
        }
        isRefreshing = false
    }
}

// Sheet Size 더 작게 Custom
extension PresentationDetent {
    static let small = Self.height(100)
}

#Preview {
    Home()
}
