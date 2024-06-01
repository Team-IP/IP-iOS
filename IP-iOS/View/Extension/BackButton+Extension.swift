//
//  BackButton+Extension.swift
//  IP-iOS
//
//  Created by DOYEON LEE on 6/2/24.
//

import SwiftUI

extension View {
    func customBackButton(dismissAction: @escaping () -> Void) -> some View {
        return self.navigationBarBackButtonHidden(true)
            .navigationBarItems(
                leading: Button(action: {
                    dismissAction()
                }) {
                    Image(systemName: "chevron.backward")
                        .foregroundColor(.ipPrimary)
                }
            )
    }
}
