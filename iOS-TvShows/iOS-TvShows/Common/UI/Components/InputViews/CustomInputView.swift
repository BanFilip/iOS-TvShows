//
//  CustomInputView.swift
//  iOS-TvShows
//
//  Created by Filip Ban on 10.11.2021..
//

import UIKit
import RxCocoa
import RxSwift

class CustomInputView: UIView {

    let type: TextFieldType

    var stackView: UIStackView!
    var textField: BaseTextField!
    var separator: SeparatorView!
    var errorLabel: UILabel!

    var isValid: Bool = true {
        didSet {
            let separatorColor: UIColor = isValid ? .appWhite.withAlphaComponent(0.7) : .red
            separator.backgroundColor = separatorColor
            errorLabel.isHidden = isValid
        }
    }

    var placeholder: String? {
        didSet {
            textField.placeholder = placeholder
        }
    }

    init(type: TextFieldType) {
        self.type = type
        super.init(frame: .zero)

        buildViews()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
