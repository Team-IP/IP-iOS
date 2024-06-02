//
//  AppInfoContent.swift
//  IP-iOS
//
//  Created by 정정욱 on 6/1/24.
//

import SwiftUI


struct MySettingContent<Content: View>: View {
    // Property
    var name: String
    // Optional property
    var content: Content
    
    init(name: String, @ViewBuilder content: () -> Content) {
        self.name = name
        self.content = content()
    }

    var body: some View {
        VStack {
            HStack {
                Text(name)
                
                Spacer()
                // Condition
                content
            } //: HStack
            
            Divider()
        } //: VStack
    }
}

#Preview {
    Group{

        MySettingContent(name: "Sample") {
                   Text("woogie")
               }
    }
}
