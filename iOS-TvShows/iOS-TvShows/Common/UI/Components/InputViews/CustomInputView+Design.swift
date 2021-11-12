//
//  CustomInputView+Design.swift
//  iOS-TvShows
//
//  Created by Filip Ban on 10.11.2021..
//

import UIKit
import SnapKit

extension CustomInputView: ConstructViewsProtocol {

    func buildViews() {
        createViews()
        styleViews()
        defineLayoutForViews()
    }

    func createViews() {
        textField = BaseTextField(with: type)
        addSubview(textField)

        separator = SeparatorView()
        addSubview(separator)
    }

    func styleViews() {
    }

    func defineLayoutForViews() {
        textField.snp.makeConstraints {
            $0.top.leading.trailing.equalToSuperview()
        }

        separator.snp.makeConstraints {
            $0.top.equalTo(textField.snp.bottom)
            $0.bottom.leading.trailing.equalToSuperview()
        }
    }
}

