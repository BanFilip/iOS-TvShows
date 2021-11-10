//
//  UIFont+Extensions.swift
//  iOS-TvShows
//
//  Created by Filip Ban on 09.11.2021..
//

import UIKit

extension UIFont {

    static let header1: UIFont = .bold(size: 34)
    static let body1: UIFont = .regular(size: 17)
    static let button1: UIFont = .medium(size: 17)
    static let button2: UIFont = .bold(size: 17)

    static func regular(size: CGFloat = 12) -> UIFont {
        UIFont(with: .regular, size: size)
    }

    static func medium(size: CGFloat = 12) -> UIFont {
        UIFont(with: .medium, size: size)
    }

    static func bold(size: CGFloat = 12) -> UIFont {
        UIFont(with: .bold, size: size)
    }

    static func italic(size: CGFloat = 12) -> UIFont {
        UIFont(with: .italic, size: size)
    }

    convenience init(with bundleFont: BundleFont, size: CGFloat ) {
        self.init(name: bundleFont.rawValue, size: size)!
    }

    private static func registerFont(fontName: String) {
        guard let url = Bundle.main.url(forResource: fontName, withExtension: "ttf") else {
            return
        }

        let fontRegistered = CTFontManagerRegisterFontsForURL(url as CFURL, .process, nil)

        #if DEBUG
        if !fontRegistered { fatalError("Failed to register font: \(fontName)") }
        #endif
    }

    static func loadAppFonts() {
        BundleFont.allCases.forEach {
            registerFont(fontName: $0.rawValue)
        }
    }

}

