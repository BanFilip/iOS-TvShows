//
//  LoginViewController.swift
//  iOS-TvShows
//
//  Created by Filip Ban on 08.11.2021..
//  Copyright (c) 2021 ___ORGANIZATIONNAME___. All rights reserved.
//
//  This file was generated by the 🐍 VIPER generator
//

import UIKit
import RxSwift
import RxCocoa
import IQKeyboardManagerSwift

final class LoginViewController: KeyboardViewController {

    // MARK: - Public properties -

    var scrollView: UIScrollView!
    var contentView: UIView!
    var stackView: UIStackView!
    var imageView: UIImageView!
    var loginLabel: UILabel!
    var helperLabel: UILabel!
    var emailInputView: CustomInputView!
    var passwordInputView: CustomInputView!
    var rememberButton: RememberButton!
    var loginButton: SecondaryButton!
    var registerButton: PrimaryButton!
    var nk: UIView!

    var presenter: LoginPresenterInterface!

    // MARK: - Private properties -

    private let disposeBag = DisposeBag()

    // MARK: - Lifecycle -

    override func viewDidLoad() {
        super.viewDidLoad()
        buildViews()
        setupView()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        IQKeyboardManager.shared.toolbarPreviousNextAllowedClasses = [UIStackView.self]
    }
}

// MARK: - Extensions -

extension LoginViewController: LoginViewInterface {
}

private extension LoginViewController {

    func setupView() {
        let output = Login.ViewOutput()

        let input = presenter.configure(with: output)
    }
}
