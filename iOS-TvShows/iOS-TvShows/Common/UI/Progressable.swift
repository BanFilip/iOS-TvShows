//
//  Progressable.swift
//
//  Created by Filip Gulan on 03/02/2019.
//  Copyright © 2019 Infinum. All rights reserved.
//

import UIKit
import SVProgressHUD

public protocol Progressable: AnyObject {
    func showLoading()
    func hideLoading()

    func showFailure(with error: Error)
    func showFailure(with title: String?, message: String?)
}

public extension Progressable {
    func showFailure(with error: Error) { }
    func showFailure(with title: String?, message: String?) { }
}

public extension Progressable where Self: UIViewController {
    // MARK: - Show/hide

    func showLoading() {
        SVProgressHUD.show()
    }

    func hideLoading() {
        SVProgressHUD.dismiss()
    }

    // MARK: - Failure handling

    func showFailure(with error: Error) {
        showFailure(with: "Error", message: error.localizedDescription)
    }

    func showFailure(with title: String?, message: String?) {
        let alertView = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alertView.addAction(UIAlertAction(title: "Ok", style: .cancel))
        present(alertView, animated: true)
    }
}
