//
//  IfTopBar.swift
//  IP-iOS
//
//  Created by DOYEON LEE on 6/1/24.
//

import SwiftUI

struct IfTopBar: View {
    var body: some View {
        HStack {
            Text("로고")
            Spacer()
            Image(systemName: "gear")
        }
        .padding()
    }
}

#Preview {
    IfTopBar()
}
