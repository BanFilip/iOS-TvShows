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
        stackView = UIStackView()
        addSubview(stackView)

        textField = BaseTextField(with: type)
        stackView.addArrangedSubview(textField)

        separator = SeparatorView()
        stackView.addArrangedSubview(separator)

        errorLabel = UILabel(with: UIFont.systemFont(ofSize: 17))
        stackView.addArrangedSubview(errorLabel)
    }

    func styleViews() {
        stackView.axis = .vertical
        stackView.spacing = 6

        errorLabel.font = UIFont.systemFont(ofSize: 17)
        errorLabel.textAlignment = .left
        errorLabel.textColor = .red
        errorLabel.isHidden = true
    }

    func defineLayoutForViews() {
        stackView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
}

