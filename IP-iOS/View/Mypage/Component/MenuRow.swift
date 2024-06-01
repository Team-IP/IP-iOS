//
//  MenuRow.swift
//  IP-iOS
//
//  Created by DOYEON LEE on 6/1/24.
//

import SwiftUI

struct MenuRow: View {
    
    let menuName: String
    
    var body: some View {
        HStack {
            Image(systemName: "person")
                .resizable()
                .frame(width: 20, height: 20)
            Text(menuName)
                .setTypo(.body2b)
            Spacer()
            Image(systemName: "arrow.forward")
                .resizable()
                .frame(width: 15, height: 15)
                .foregroundColor(.ipGray03)
        }
        .padding(.vertical, 7)
        .padding(.horizontal, PAGE_PADDING)
        Divider()
    }
}
