//
//  CreateImageView.swift
//  IP-iOS
//
//  Created by 정정욱 on 6/2/24.
//

import SwiftUI

struct CreateImageView: View {
    var body: some View {
        VStack {
            Image("createMy")
                .resizable()
                .scaledToFill()
                .frame(width: 300, height: 550)
        }
    }
}

#Preview {
    CreateImageView()
}
