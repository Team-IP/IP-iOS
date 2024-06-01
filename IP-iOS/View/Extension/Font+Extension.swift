//
//  Font+Extension.swift
//  IP-iOS
//
//  Created by DOYEON LEE on 6/1/24.
//

import UIKit
import SwiftUI

public enum FontWeight {
    case thin, extraLight, light, regular, medium
    case semiBold, bold, extraBold, black
}


public extension UILabel {
    /// - 예시
    /// ```
    /// let label = UILabel()
    /// label.setDefaultFont(size: 18, weight: .bold)
    /// ```
    ///
    func setDefaultFont(
        size: CGFloat = 16,
        weight: FontWeight = .regular
    ) {
        switch weight {
        case .black:
            self.font = UIFont(name: "NotoSansKR-Black", size: size)
        case .extraBold:
            self.font = UIFont(name: "NotoSansKR-ExtraBold", size: size)
        case .bold:
            self.font = UIFont(name: "NotoSansKR-Bold", size: size)
        case .semiBold:
            self.font = UIFont(name: "NotoSansKR-SemiBold", size: size)
        case .medium:
            self.font = UIFont(name: "NotoSansKR-Medium", size: size)
        case .regular:
            self.font = UIFont(name: "NotoSansKR-Regular", size: size)
        case .light:
            self.font = UIFont(name: "NotoSansKR-Light", size: size)
        case .extraLight:
            self.font = UIFont(name: "NotoSansKR-ExtraLight", size: size)
        case .thin:
            self.font = UIFont(name: "NotoSansKR-Thin", size: size)
        }
    }
}

public extension Text {
    /// - 예시
    /// ```swift
    /// Text("Hello, SwiftUI!")
    ///    .defaultFont(size: 24, weight: .bold)
    /// ```
    func setDefaultFont(size: CGFloat = 16, weight: FontWeight = .regular) -> some View {
        var fontName: String
        switch weight {
        case .black:
            fontName = "NotoSansKR-Black"
        case .extraBold:
            fontName = "NotoSansKR-ExtraBold"
        case .bold:
            fontName = "NotoSansKR-Bold"
        case .semiBold:
            fontName = "NotoSansKR-SemiBold"
        case .medium:
            fontName = "NotoSansKR-Medium"
        case .regular:
            fontName = "NotoSansKR-Regular"
        case .light:
            fontName = "NotoSansKR-Light"
        case .extraLight:
            fontName = "NotoSansKR-ExtraLight"
        case .thin:
            fontName = "NotoSansKR-Thin"
        }
        return self.font(.custom(fontName, size: size))
    }
}
