//
//  LeafSellRow.swift
//  IP-iOS
//
//  Created by DOYEON LEE on 6/1/24.
//

import SwiftUI

struct LeafSellRow: View {
    
    let leafCount: Int
    let price: Int?
    
    var body: some View {
        HStack {
            Image("leaf-icon")
            HStack(spacing: 2) {
                Text("\(leafCount)")
                    .setTypo(.body1b)
                    .foregroundColor(.ipPrimary)
                Text("잎")
                    .setTypo(.body1b)
                    .foregroundColor(.gray)
            }
            Spacer()
            if price != nil {
                Text("\(price ?? 0)원")
                    .setTypo(.body1)
                    .foregroundColor(.ipBlack.opacity(0.8))
                Button(action: {
                    print("구매하기")
                }) {
                    Text("구매하기")
                        .setTypo(.body2b)
                        .foregroundColor(.ipPrimary)
                        .padding(.horizontal, 15)
                        .padding(.vertical, 8)
                        .background(.gray.opacity(0.1))
                        .cornerRadius(50)
                        .overlay(
                            RoundedRectangle(cornerRadius: 50)
                                .stroke(.gray.opacity(0.5), lineWidth: 1)
                        )
                }
            } else {
                Button(action: {
                    print("광고 시청하기")
                }) {
                    Text("광고 시청하기")
                        .setTypo(.body2b)
                        .foregroundColor(.ipLine)
                        .padding(.horizontal, 15)
                        .padding(.vertical, 8)
                        .background(.ipPrimary)
                        .cornerRadius(50)
                }
            }
        }
    }
}
