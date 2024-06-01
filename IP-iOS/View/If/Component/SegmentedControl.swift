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
                            .setTypo(
                                selectedSegment == segment
                                ? .body2b
                                : .body2
                            )
                            .padding(.vertical, 7)
                            .padding(.horizontal, 15)
                            .background(
                                selectedSegment == segment
                                ? Color.ipLine
                                : Color.ipGray01
                            )
                            .foregroundColor(
                                selectedSegment == segment 
                                ? Color.white.opacity(0.8)
                                : Color.ipLine
                            )
                            .overlay(
                                RoundedRectangle(cornerRadius: segmentCornerRadius)
                                    .stroke(Color.ipLine.opacity(0.4), lineWidth: 2)
                            )
                            .cornerRadius(segmentCornerRadius)
                            .animation(.none, value: selectedSegment)
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
