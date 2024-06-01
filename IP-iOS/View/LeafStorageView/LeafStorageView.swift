//
//  LeafStorageView.swift
//  IP-iOS
//
//  Created by DOYEON LEE on 6/1/24.
//

import SwiftUI

struct LeafStorageView: View {
    var body: some View {
        ScrollView {
            VStack {
                Text("잎 저장소")
                HStack {
                    VStack {
                        Text("남은 잎")
                        Text("200 잎")
                    }
                    Divider()
                    VStack {
                        Text("사용한 잎")
                        Text("200잎")
                    }
                }
                .frame(maxWidth: .infinity)
                .padding()
                .background(.gray)
                
                Group {
                    LeafSellRow(leafCount: 100, price: nil)
                    LeafSellRow(leafCount: 10, price: 1000)
                    LeafSellRow(leafCount: 30, price: 2900)
                    LeafSellRow(leafCount: 50, price: 4900)
                    LeafSellRow(leafCount: 100, price: 9900)
                }
                .padding(.horizontal)
                
                VStack(alignment: .leading) {
                    Text("친구한테 공유하고 50잎 받아가자 🔥")
                    Button(action: {
                        
                    }) {
                        Text("친구한테 공유하기")
                    }
                }
                .frame(maxWidth: .infinity, minHeight: 100)
                .background(.gray)
                
                LeafSellRow(leafCount: 200, price: 12900)
                    .padding(.horizontal)
            }
        }
    }
}

#Preview {
    LeafStorageView()
}
