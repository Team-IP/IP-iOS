//
//  IfView.swift
//  IP-iOS
//
//  Created by DOYEON LEE on 6/1/24.
//

import SwiftUI
import Combine

enum Segment: String, CaseIterable {
    case all = "전체"
    case romance = "연애"
    case economy = "경제/주식"
    case sports = "스포츠"
    case content = "일상"
    
    var eng: String? {
        switch(self) {
            
        case .all:
            nil
        case .romance:
            "ENTER"
        case .economy:
            "ECONOMY"
        case .sports:
            "SPORT"
        case .content:
            "DAILY"
        }
    }
}

struct IfView: View {
    
    @State private var path = NavigationPath([String]())
    @State private var selectedSegment: Segment = .all
    @State private var isFloatingButtonOn: Bool = false
    @State private var isRefreshing: Bool = false
    
    @State private var ifCategories: [IfCategoryDTO] = []
    @State private var pageNumber: Int = 0
    
    var body: some View {
        NavigationStack(path: $path) {
            ZStack {
                VStack {
                    IfTopBar(path: $path)
                    SegmentedControl(selectedSegment: $selectedSegment)
                    List {

                        ForEach(ifCategories) { item in
                            VoteCell()
                                .frame(height: 300)
                                .listRowSeparator(.hidden)
                                .background(Color.clear)
                                .onAppear {
                                    if item == ifCategories.last {
                                        Task {
                                            await loadMoreData()
                                        }
                                    }
                                }
                        }

                    }
                    .listStyle(.plain)
                    .refreshable {
                        pageNumber = 0
                        await refreshData()
                    }
                }
                .background(.ipBackground)
                .onReceive(Just(selectedSegment)) { _ in
                    pageNumber = 0
                    Task {
                        await refreshData()
                    }
                }
                
                if isFloatingButtonOn {
                    Color.black.opacity(0.2)
                        .edgesIgnoringSafeArea(.all)
                        .transition(.opacity)
                }
                
                VStack {
                    Spacer()
                    HStack {
                        Spacer()
                        FloatingButton(
                            isFloatingButtonOn: $isFloatingButtonOn,
                            onTapNewVoteButton: onTapNewVoteButton,
                            onTapMyVoteButton: onTapMyVoteButton
                        )
                    }
                }
                .navigationDestination(for: String.self) { value in
                    switch (value) {
                    case "설정":
                        EmptyView()
                    default:
                        EmptyView()
                    }
                }
            }
            .background(.ipBackground)
            .onAppear() {
                Task {
                    await refreshData()
                }
            }
        }
    }
    
    func onTapNewVoteButton() {
        fatalError("Not implemented")
    }
    
    func onTapMyVoteButton() {
        fatalError("Not implemented")
    }
    
    private func refreshData() async {
        // 데이터 새로고침 로직
        isRefreshing = true
        
        do {
            let fetchedCategories = try await IfCategoryService.shared.fetch(
                category: selectedSegment.eng,
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
                category: selectedSegment.eng,
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

struct IfView_Previews: PreviewProvider {
    static var previews: some View {
        IfView()
    }
}
