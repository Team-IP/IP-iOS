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
                .background(Color(hex: "F6F6F6"))
                .cornerRadius(8)
                .overlay(
                    RoundedRectangle(cornerRadius: 8)
                        .stroke(Color(hex: "E8E8E8"), lineWidth: 1)
                )
                .foregroundColor(.gray)
        } else {
            TextField(placeholder, text: $text)
                .padding()
                .background(Color(hex: "F6F6F6"))
                .cornerRadius(8)
                .overlay(
                    RoundedRectangle(cornerRadius: 8)
                        .stroke(Color(hex: "E8E8E8"), lineWidth: 1)
                )
                .foregroundColor(.gray)
        }
    }
}
