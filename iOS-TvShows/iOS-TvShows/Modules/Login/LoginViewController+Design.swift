//
//  LoginViewController+Design.swift
//  iOS-TvShows
//
//  Created by Filip Ban on 09.11.2021..
//

import UIKit
import SnapKit

extension LoginViewController: ConstructViewsProtocol {

    func buildViews() {
        createViews()
        styleViews()
        defineLayoutForViews()
    }

    func createViews() {
        scrollView = UIScrollView()
        view.addSubview(scrollView)

        contentView = UIView()
        scrollView.addSubview(contentView)

        stackView = UIStackView()
        contentView.addSubview(stackView)

        imageView = UIImageView()
        stackView.addArrangedSubview(imageView)

        loginLabel = UILabel(with: UIFont.boldSystemFont(ofSize: 34))
        stackView.addArrangedSubview(loginLabel)

        helperLabel = UILabel(with: UIFont.systemFont(ofSize: 17))
        stackView.addArrangedSubview(helperLabel)

        emailInputView = CustomInputView(type: .email)
        stackView.addArrangedSubview(emailInputView)

        passwordInputView = CustomInputView(type: .password)
        stackView.addArrangedSubview(passwordInputView)

        rememberButton = RememberButton()
        stackView.addArrangedSubview(rememberButton)

        loginButton = SecondaryButton()
        stackView.addArrangedSubview(loginButton)

        registerButton = PrimaryButton()
        stackView.addArrangedSubview(registerButton)
    }

    func styleViews() {
        hideNavigationBar()
        view.backgroundColor = UIColor(patternImage: UIImage(with: .loginBackgroundImage))
        view.addGestureRecognizer(UITapGestureRecognizer(
                                    target: view,
                                    action: #selector(UIView.endEditing(_:))))

        scrollView.showsVerticalScrollIndicator = false

        stackView.axis = .vertical
        stackView.spacing = 20

        imageView.image = UIImage(with: .logo)
        imageView.contentMode = .scaleAspectFit

        loginLabel.text = "Login"
        loginLabel.textAlignment = .left
        loginLabel.textColor = .appWhite

        helperLabel.text = "In order to continue please log in."
        helperLabel.textAlignment = .left
        helperLabel.textColor = .appWhite

        emailInputView.placeholder = "Email"

        passwordInputView.placeholder = "Password"

        rememberButton.setTitle("Remember me", for: .normal)

        loginButton.setTitle("Login", for: .normal)

        registerButton.setTitle("Register", for: .normal)
    }

    func defineLayoutForViews() {
        scrollView.snp.makeConstraints {
            $0.top.leading.trailing.equalToSuperview()
            bottomConstraint = $0.bottom.equalTo(view.safeAreaLayoutGuide).constraint
        }

        contentView.snp.makeConstraints {
            $0.width.equalTo(view)
            $0.edges.equalToSuperview()
        }

        stackView.snp.makeConstraints {
            $0.top.equalToSuperview().inset(120)
            $0.leading.trailing.equalToSuperview().inset(20)
            $0.bottom.equalToSuperview()
        }

        imageView.snp.makeConstraints {
            $0.centerX.equalToSuperview()
        }
    }
}
