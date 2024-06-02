//
//  IPTextField.swift
//  IP-iOS
//
//  Created by DOYEON LEE on 6/1/24.
//

import SwiftUI

struct IPTextField: View {
    var placeholder: String
    @Binding var text: String
    var isSecure: Bool = false
    
    var body: some View {
        if isSecure {
            SecureField(placeholder, text: $text)
                .foregroundColor(.ipBlack)
                .padding()
                .background(.ipGray01)
                .cornerRadius(10)
                .overlay(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(.ipGray02, lineWidth: 1)
                )
                .foregroundColor(.gray)
        } else {
            TextField(placeholder, text: $text)
                .foregroundColor(.ipBlack)
                .padding()
                .background(.ipGray01)
                .cornerRadius(10)
                .overlay(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(.ipGray02, lineWidth: 1)
                )
                .foregroundColor(.gray)
        }
    }
}
