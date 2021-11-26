//
//  ShowsViewController.swift
//  iOS-TvShows
//
//  Created by Filip Ban on 23.11.2021..
//  Copyright (c) 2021 ___ORGANIZATIONNAME___. All rights reserved.
//
//  This file was generated by the 🐍 VIPER generator
//

import UIKit
import RxSwift
import RxCocoa

final class ShowsViewController: UIViewController {

    // MARK: - Public properties -

    var tableView: UITableView!
    var presenter: ShowsPresenterInterface!

    // MARK: - Private properties -

    private let disposeBag = DisposeBag()

    private lazy var tableDataSource: TableDataSourceDelegate = {
        return TableDataSourceDelegate(tableView: tableView)
    }()

    // MARK: - Lifecycle -

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setupView()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(false, animated: animated)
    }
}

// MARK: - Extensions -

extension ShowsViewController: ShowsViewInterface {
}

private extension ShowsViewController {

    func setupUI() {
        title = "Shows"
        navigationController?.styleNavBar(prefersLargeTitles: true)
        navigationItem.rightBarButtonItem = UIBarButtonItem(
            image: UIImage.TVShows.Icons.settings.withRenderingMode(.alwaysOriginal),
            style: .plain,
            target: nil,
            action: nil
        )

        view.backgroundColor = UIColor.TVShows.appWhite
        tableView = UITableView()
        view.addSubview(tableView)
        tableView.registerClass(cellOfType: ShowTableViewCell.self)

        tableView.snp.makeConstraints {
            $0.edges.equalTo(view.safeAreaLayoutGuide)
        }
    }

    func setupView() {
        guard let rightBarButton = navigationItem.rightBarButtonItem else { return }
        let output = Shows.ViewOutput(
            settings: rightBarButton.rx.tap.asSignal()
        )
        let input = presenter.configure(with: output)
        handle(input.shows)
    }
}

private extension ShowsViewController {
    func handle(_ shows: Driver<[TableCellItem]>) {
        shows
            .drive(tableDataSource.rx.items)
            .disposed(by: disposeBag)
    }
}
