//
//  Keyboard+Extension.swift
//  IP-iOS
//
//  Created by DOYEON LEE on 6/2/24.
//

import SwiftUI

extension View {
    func addHideKeyboardGuesture() -> some View {
        return self.onTapGesture {
            UIApplication.shared.sendAction(
                #selector(UIResponder.resignFirstResponder),
                to: nil,
                from: nil,
                for: nil
            )
        }
    }
}
