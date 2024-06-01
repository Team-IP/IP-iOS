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
    
    @State private var selectedSegment: Segment = .all
    @State private var isFloatingButtonOn: Bool = false
    
    var body: some View {
        ZStack {
            VStack {
                IfTopBar()
                SegmentedControl(selectedSegment: $selectedSegment)
                Spacer()
                Text("Selected Segment: \(selectedSegment.rawValue)")
                    .font(.largeTitle)
                    .padding()
                Spacer()
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
        }
    }
    
    func onTapNewVoteButton() {
        fatalError("Not implemented")
    }
    
    func onTapMyVoteButton() {
        fatalError("Not implemented")
    }
    
}

struct IfView_Previews: PreviewProvider {
    static var previews: some View {
        IfView()
    }
}