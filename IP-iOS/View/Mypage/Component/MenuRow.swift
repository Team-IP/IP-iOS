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
            Spacer()
        }
        .padding()
        Divider()
    }
}
