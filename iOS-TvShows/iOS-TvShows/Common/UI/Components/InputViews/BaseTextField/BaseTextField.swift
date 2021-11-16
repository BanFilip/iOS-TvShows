//
//  BaseTextField.swift
//  iOS-TvShows
//
//  Created by Filip Ban on 10.11.2021..
//

import UIKit

class BaseTextField: UITextField {

    let defaultHeight: CGFloat = 36

    override var isSecureTextEntry: Bool {
        didSet {
            guard button != nil else { return }

            let image = isSecureTextEntry ?
                UIImage.TVShows.Icons.icInvisible :
                UIImage.TVShows.Icons.icVisible
            button.setImage(image, for: .normal)
        }
    }

    override var placeholder: String? {
        didSet {
            guard let placeholder = placeholder else { return }

            attributedPlaceholder = NSAttributedString(
                string: placeholder,
                attributes: [
                    NSAttributedString.Key.foregroundColor: UIColor.TVShows.appWhite.withAlphaComponent(0.7)
                ])
        }
    }

    private let padding: UIEdgeInsets = UIEdgeInsets(top: 0, left: 12, bottom: 12, right: 38)

    private var button: UIButton!

    init(with type: TextFieldType) {
        super.init(frame: .zero)

        buildViews()
        style(by: type)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func textRect(forBounds bounds: CGRect) -> CGRect {
        bounds.inset(by: padding)
    }

    override func placeholderRect(forBounds bounds: CGRect) -> CGRect {
        bounds.inset(by: padding)
    }

    override func editingRect(forBounds bounds: CGRect) -> CGRect {
        bounds.inset(by: padding)
    }

    private func style(by type: TextFieldType) {
        if type == .password {
            makeVisibilityButton()
        }
        let model = type.model

        autocapitalizationType = model.autocapitalizationType
        autocorrectionType = model.autocorrectionType
        keyboardType = model.keyboardType
        isSecureTextEntry = model.isSecureTextEntry
    }

    private func makeVisibilityButton() {
        button = UIButton()
        button.frame = CGRect(x: 0, y: 0, width: 24, height: 24)
        button.contentEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 12, right: 12)
        button.addTarget(self, action: #selector(togglePasswordVisibility), for: .touchUpInside)

        rightView = button
        rightViewMode = .always
    }

    @objc
    private func togglePasswordVisibility() {
        isSecureTextEntry.toggle()
    }
}

