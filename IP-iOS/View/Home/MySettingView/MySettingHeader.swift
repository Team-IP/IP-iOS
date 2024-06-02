//
//  AppInfoHeader.swift
//  IP-iOS
//
//  Created by 정정욱 on 6/1/24.
//

import SwiftUI

struct MySettingHeader: View {
    //property
    var name: String
    
    var body: some View {
        VStack{

            HStack{
                Text(name)
                    .font(.title2)
                    .bold()
                Spacer()
               
            }//:HStack
          
        }//:VStack

    }
}

#Preview {
    MySettingHeader(name: "회원가입 정보")
}
