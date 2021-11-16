//
//  String+Extensions.swift
//  iOS-TvShows
//
//  Created by Filip Ban on 11.11.2021..
//

import Foundation

extension String {
    var isEmailValid: Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailPred = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailPred.evaluate(with: self)
    }

    var isPasswordValid: Bool {
        self.count >= 6
    }
}
