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

final class LoginViewController: UIViewController {

    // MARK: - Public properties -

    var scrollView: UIScrollView!
    var contentView: UIView!
    var stackView: UIStackView!
    var imageView: UIImageView!
    var loginLabel: UILabel!
    var helperLabel: UILabel!
    var emailInputView: CustomInputView!
    var passwordInputView: CustomInputView!
    var rememberButton: UIButton!
    var loginButton: SecondaryButton!
    var registerButton: PrimaryButton!

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
        navigationController?.hideNavigationBar(animated)
    }
}

// MARK: - Extensions -

extension LoginViewController: LoginViewInterface {
}

private extension LoginViewController {

    func setupView() {
        KeyboardHandler
            .register(scrollView: scrollView)
            .disposed(by: disposeBag)
        let output = Login.ViewOutput()

        let input = presenter.configure(with: output)
    }
}
