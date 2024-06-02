//
//  IfTopBar.swift
//  IP-iOS
//
//  Created by DOYEON LEE on 6/1/24.
//

import SwiftUI

struct IfTopBar: View {
    
    @Binding var path: NavigationPath
    
    var body: some View {
        HStack {
            Image("logo-color")
                .resizable()
                .frame(width: 25, height: 25)
            Spacer()
            Image("setting-navy-icon")
                .resizable()
                .frame(width: 25, height: 25)
                .onTapGesture {
                    path.append("설정")
                }
        }
        .padding(.horizontal, PAGE_PADDING)
    }
}
