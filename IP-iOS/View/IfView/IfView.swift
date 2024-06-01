//
//  IfView.swift
//  IP-iOS
//
//  Created by DOYEON LEE on 6/1/24.
//

import SwiftUI

struct IfView: View {
    private let segmentCornerRadius: CGFloat = 25
    
    private enum Segment: String, CaseIterable {
        case all = "전체"
        case romance = "연애"
        case economy = "경제/주식"
        case sports = "스포츠"
        case content = "일상"
    }
    
    @State private var selectedSegment: Segment = .all
    
    var body: some View {
        ZStack {
            VStack {
                topBar
                segmentedControl
                Spacer()
                Text("Selected Segment: \(selectedSegment.rawValue)")
                    .font(.largeTitle)
                    .padding()
                Spacer()
            }
            VStack {
                Spacer()
                HStack {
                    Spacer()
                    newButton
                }
            }
        }
    }
    
    private var topBar: some View {
        HStack {
            Text("로고")
            Spacer()
            Image(systemName: "gear")
        }
        .padding()
    }
    
    private var segmentedControl: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 8) {
                ForEach(Segment.allCases, id: \.self) { segment in
                    Button(action: {
                        selectedSegment = segment
                    }) {
                        Text(segment.rawValue)
                            .padding()
                            .background(selectedSegment == segment ? Color.black : Color.white)
                            .foregroundColor(selectedSegment == segment ? Color.white : Color.black)
                            .cornerRadius(segmentCornerRadius)
                            .overlay(
                                RoundedRectangle(cornerRadius: segmentCornerRadius)
                                    .stroke(Color.black, lineWidth: 1)
                            )
                    }
                    .buttonStyle(PlainButtonStyle())
                }
            }
        }
        .padding()
    }
    
    var newButton: some View {
        Button(action: {
            print("Button Tapped")
        }) {
            Text("+")
                .font(.system(size: 24, weight: .bold))
                .foregroundColor(.white)
                .padding()
                .frame(width: 50, height: 50)
                .background(Color.blue)
                .cornerRadius(25)
        }
    }

}

struct IfView_Previews: PreviewProvider {
    static var previews: some View {
        IfView()
    }
}
