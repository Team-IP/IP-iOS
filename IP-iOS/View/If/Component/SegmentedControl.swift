//
//  SegmentedControl.swift
//  IP-iOS
//
//  Created by DOYEON LEE on 6/1/24.
//

import SwiftUI

struct SegmentedControl: View {
    let segmentCornerRadius: CGFloat = 25
    
    @Binding var selectedSegment: Segment
    
    var body: some View {
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
}

#Preview {
    SegmentedControl(selectedSegment: .constant(.all))
}
