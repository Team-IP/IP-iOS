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
                .padding()
                .background(.ipGray01)
                .cornerRadius(10)
                .overlay(
                    RoundedRectangle(cornerRadius: 8)
                        .stroke(.ipGray02, lineWidth: 1)
                )
                .foregroundColor(.gray)
        } else {
            TextField(placeholder, text: $text)
                .padding()
                .background(.ipGray01)
                .cornerRadius(10)
                .overlay(
                    RoundedRectangle(cornerRadius: 8)
                        .stroke(.ipGray02, lineWidth: 1)
                )
                .foregroundColor(.gray)
        }
    }
}
