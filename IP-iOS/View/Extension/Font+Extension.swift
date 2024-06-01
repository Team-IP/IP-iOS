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

public enum Typo {
    case heading1, heading1b, heading2
    case body0, body0b, body1, body1b, body2, body2b, body3, body3b
    case detail
}


public extension UILabel {
    /// - 예시
    /// ```swift
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
    
    /// - 예시
    /// ```swift
    /// let label = UILabel()
    /// label.setTypo(.heading1)
    /// ```
    ///
    func setTypo(_ typo: Typo) {
        switch typo {
        case .heading1:
            self.setDefaultFont(size: 32, weight: .medium)
        case .heading1b:
            self.setDefaultFont(size: 32, weight: .bold)
        case .heading2:
            self.setDefaultFont(size: 28, weight: .bold)
        case .body0:
            self.setDefaultFont(size: 22, weight: .regular)
        case .body0b:
            self.setDefaultFont(size: 22, weight: .bold)
        case .body1:
            self.setDefaultFont(size: 16, weight: .regular)
        case .body1b:
            self.setDefaultFont(size: 16, weight: .bold)
        case .body2:
            self.setDefaultFont(size: 14, weight: .medium)
        case .body2b:
            self.setDefaultFont(size: 14, weight: .bold)
        case .body3:
            self.setDefaultFont(size: 12, weight: .medium)
        case .body3b:
            self.setDefaultFont(size: 12, weight: .bold)
        case .detail:
            self.setDefaultFont(size: 10, weight: .regular)
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
    
    /// - 예시
    /// ```swift
    /// Text("Hello, SwiftUI!")
    ///    .setTypo(.heading1)
    /// ```
    func setTypo(_ typo: Typo) -> some View {
        switch (typo) {
        case .heading1:
            return self.setDefaultFont(size: 32, weight: .medium)
        case .heading1b:
            return self.setDefaultFont(size: 32, weight: .bold)
        case .heading2:
            return self.setDefaultFont(size: 28, weight: .bold)
        case .body0:
            return self.setDefaultFont(size: 22, weight: .regular)
        case .body0b:
            return self.setDefaultFont(size: 22, weight: .bold)
        case .body1:
            return self.setDefaultFont(size: 16, weight: .regular)
        case .body1b:
            return self.setDefaultFont(size: 16, weight: .bold)
        case .body2:
            return self.setDefaultFont(size: 14, weight: .medium)
        case .body2b:
            return self.setDefaultFont(size: 14, weight: .bold)
        case .body3:
            return self.setDefaultFont(size: 12, weight: .medium)
        case .body3b:
            return self.setDefaultFont(size: 12, weight: .bold)
        case .detail:
            return self.setDefaultFont(size: 10, weight: .regular)
        }
    }
}
