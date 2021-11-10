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

        loginLabel = UILabel(with: .header1)
        stackView.addArrangedSubview(loginLabel)

        helperLabel = UILabel(with: .body1)
        stackView.addArrangedSubview(helperLabel)

        emailTextField = UITextField()
        stackView.addArrangedSubview(emailTextField)

        firstSeparator = UIView()
        stackView.addArrangedSubview(firstSeparator)

        passwordTextField = UITextField()
        stackView.addArrangedSubview(passwordTextField)

        secondSeparator = UIView()
        stackView.addArrangedSubview(secondSeparator)

//        visibilityButton = UIButton()
//        passwordTextField.addSubview(visibilityButton)

        rememberButton = UIButton()
        stackView.addArrangedSubview(rememberButton)

        loginButton = UIButton()
        stackView.addArrangedSubview(loginButton)

        registerButton = UIButton()
        stackView.addArrangedSubview(registerButton)
    }

    func styleViews() {
        hideNavigationBar()
        view.backgroundColor = UIColor(patternImage: UIImage(with: .loginBackgroundImage))

        stackView.axis = .vertical
        stackView.spacing = 30

        imageView.image = UIImage(with: .logo)
        imageView.contentMode = .scaleAspectFit

        loginLabel.text = "Login"
        loginLabel.textAlignment = .left
        loginLabel.textColor = .appWhite

        helperLabel.text = "In order to continue please log in."
        helperLabel.textAlignment = .left
        helperLabel.textColor = .appWhite

        emailTextField.textColor = .appWhite
        emailTextField.font = .body1
        emailTextField.attributedPlaceholder = NSAttributedString(
            string: "Email",
            attributes: [NSAttributedString.Key.foregroundColor : UIColor.appWhite.withAlphaComponent(0.7)])

        firstSeparator.backgroundColor = .appWhite.withAlphaComponent(0.7)

        passwordTextField.textColor = .appWhite
        passwordTextField.font = .body1
        passwordTextField.isSecureTextEntry = true
        passwordTextField.attributedPlaceholder = NSAttributedString(
            string: "Password",
            attributes: [NSAttributedString.Key.foregroundColor : UIColor.appWhite.withAlphaComponent(0.7)])

//        visibilityButton.frame = CGRect(x: 0, y: 0, width: 12, height: 12)
//        visibilityButton.setImage(UIImage(with: .invisible), for: .normal)
//        visibilityButton.imageView?.contentMode = .scaleAspectFit
//        passwordTextField.rightView = visibilityButton
//        passwordTextField.rightViewMode = .always

        passwordTextField.rightView = visibilityButton

        secondSeparator.backgroundColor = .appWhite.withAlphaComponent(0.7)

        rememberButton.setTitle("Remember me", for: .normal)
        rememberButton.setTitleColor(.appWhite, for: .normal)
        rememberButton.titleLabel?.font = .body1
        rememberButton.setImage(UIImage(with: .checkboxUnselected), for: .normal)
        rememberButton.contentHorizontalAlignment = .leading
        rememberButton.titleEdgeInsets = UIEdgeInsets(top: 0, left: 8, bottom: 0, right: 0)

        loginButton.setTitle("Login", for: .normal)
        loginButton.setTitleColor(.appPurple, for: .normal)
        loginButton.titleLabel?.font = .button1
        loginButton.backgroundColor = .appWhite
        loginButton.roundAllCorners(withRadius: 24)

        registerButton.setTitle("Register", for: .normal)
        registerButton.setTitleColor(.appWhite, for: .normal)
        registerButton.titleLabel?.font = .button2
    }

    func defineLayoutForViews() {
        scrollView.snp.makeConstraints {
            $0.top.equalToSuperview().inset(120)
            $0.leading.trailing.equalToSuperview()
            $0.bottom.equalTo(view.safeAreaLayoutGuide)
        }

        contentView.snp.makeConstraints {
            $0.width.equalTo(view)
            $0.edges.equalToSuperview()
        }

        stackView.snp.makeConstraints {
            $0.top.bottom.equalToSuperview()
            $0.leading.trailing.equalToSuperview().inset(20)
        }

        imageView.snp.makeConstraints {
            $0.centerX.equalToSuperview()
        }

        helperLabel.snp.makeConstraints {
            $0.top.equalTo(loginLabel.snp.bottom).offset(20)
        }

        firstSeparator.snp.makeConstraints {
            $0.top.equalTo(emailTextField.snp.bottom).offset(12)
            $0.height.equalTo(1)
        }

        secondSeparator.snp.makeConstraints {
            $0.top.equalTo(passwordTextField.snp.bottom).offset(12)
            $0.height.equalTo(1)
        }

        loginButton.snp.makeConstraints {
            $0.height.equalTo(48)
        }
    }
}
