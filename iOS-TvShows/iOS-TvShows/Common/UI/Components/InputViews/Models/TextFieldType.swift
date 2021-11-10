//
//  TextFieldType.swift
//  iOS-TvShows
//
//  Created by Filip Ban on 10.11.2021..
//

enum TextFieldType {

    case email
    case password

    var model: TextFieldTypeModel {
        switch self {
        case .email:
            return TextFieldTypeModel(
                autocapitalizationType: .none,
                autocorrectionType: .no,
                keyboardType: .emailAddress,
                isSecureTextEntry: false)
        case .password:
            return TextFieldTypeModel(
                autocapitalizationType: .none,
                autocorrectionType: .no,
                keyboardType: .default,
                isSecureTextEntry: true)

        }
    }
}

