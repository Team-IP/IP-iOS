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
            Image(systemName: "leaf.fill")
            Text("\(leafCount)잎")
                .foregroundStyle(.ipLine)
            Spacer()
            if price != nil {
                Text("\(price ?? 0)원")
                Button(action: {
                    print("구매하기")
                }) {
                    Text("구매하기")
                        .foregroundColor(.black)
                        .padding()
                        .background(.gray.opacity(0.1))
                        .cornerRadius(50)
                }
            } else {
                Button(action: {
                    print("광고 시청하기")
                }) {
                    Text("광고 시청하기")
                        .foregroundColor(.black)
                        .padding()
                        .background(.gray.opacity(0.1))
                        .cornerRadius(50)
                }
            }
        }
    }
}
