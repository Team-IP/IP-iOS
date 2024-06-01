//
//  IfView.swift
//  IP-iOS
//
//  Created by DOYEON LEE on 6/1/24.
//

import SwiftUI

enum Segment: String, CaseIterable {
    case all = "전체"
    case romance = "연애"
    case economy = "경제/주식"
    case sports = "스포츠"
    case content = "일상"
}

struct IfView: View {
    
    @State private var path = NavigationPath([String]())
    @State private var selectedSegment: Segment = .all
    @State private var isFloatingButtonOn: Bool = false
    @State private var isRefreshing: Bool = false
    
    var body: some View {
        NavigationStack(path: $path) {
            ZStack {
                VStack {
                    IfTopBar(path: $path)
                    SegmentedControl(selectedSegment: $selectedSegment)
                    List {
//                        VoteCell()
//                            .listRowSeparator(.hidden)
//                            .background(Color.clear)
//                        VoteCell()
//                            .listRowSeparator(.hidden)
//                        VoteCell()
//                            .listRowSeparator(.hidden)
                    }
                    .listStyle(.inset)
                    .refreshable {
                        await refreshData()
                    }
                    .background(.ipBackground)
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
        print("Refreshing data...")
        // 예: 네트워크 요청을 통해 데이터를 가져옵니다.
        // await someNetworkCall()
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            isRefreshing = false
        }
    }
    
}

struct IfView_Previews: PreviewProvider {
    static var previews: some View {
        IfView()
    }
}
