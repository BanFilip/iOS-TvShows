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

    var textField: BaseTextField!
    var separator: SeparatorView!

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
