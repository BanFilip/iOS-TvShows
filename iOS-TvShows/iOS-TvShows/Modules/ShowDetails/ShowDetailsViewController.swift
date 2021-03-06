//
//  ShowDetailsViewController.swift
//  iOS-TvShows
//
//  Created by Filip Ban on 24.11.2021..
//  Copyright (c) 2021 ___ORGANIZATIONNAME___. All rights reserved.
//
//  This file was generated by the 🐍 VIPER generator
//

import UIKit
import RxSwift
import RxCocoa

final class ShowDetailsViewController: UIViewController, Refreshable {

    // MARK: - Public properties -

    lazy var refreshControl: UIRefreshControl = {
        let refreshControl = UIRefreshControl()
        tableView.refreshControl = refreshControl
        return refreshControl
    }()

    var presenter: ShowDetailsPresenterInterface!

    // MARK: - Private properties -

    private let headerView = ShowDetailsHeaderView()
    private let tableView = UITableView()
    private let createReviewButton = PrimaryButton()

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

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        sizeHeaderToFit()
    }

    private func sizeHeaderToFit() {
        let height = headerView.systemLayoutSizeFitting(UIView.layoutFittingCompressedSize).height
        var frame = headerView.frame
        frame.size.height = height
        headerView.frame = frame

        headerView.setNeedsLayout()
        headerView.layoutIfNeeded()

        tableView.tableHeaderView = headerView
    }
}

// MARK: - Extensions -

extension ShowDetailsViewController: ShowDetailsViewInterface {
}

private extension ShowDetailsViewController {

    func setupView() {
        let pullToRefresh = refreshControl.rx
            .controlEvent(.valueChanged)
            .asDriver()
            .mapToVoid()
        let willDisplayLastCell = tableView.rx
            .reachedBottomOnceWith(restart: pullToRefresh)

        let output = ShowDetails.ViewOutput(
            createReview: createReviewButton.rx.tap.asSignal(),
            pullToRefresh: pullToRefresh,
            willDisplayLastCell: willDisplayLastCell
        )

        let input = presenter.configure(with: output)
        handleShow(input.show)
        handleReviews(input.reviews)
    }

    func handleShow(_ show: Driver<Show>) {
        show
            .map { $0.title }
            .drive(rx.title)
            .disposed(by: disposeBag)

        show
            .drive(onNext: { [unowned self] show in
                headerView.configure(with: show)
            })
            .disposed(by: disposeBag)
    }

    func handleReviews(_ reviews: Driver<[TableCellItem]>) {
        reviews
            .do(onNext: { [unowned self] _ in self.endRefreshing() })
            .drive(tableDataSource.rx.items)
            .disposed(by: disposeBag)
    }
}

private extension ShowDetailsViewController {

    func setupUI() {
        addSubviews()
        configureView()
        configureSubviews()
        defineConstraints()
    }

    func addSubviews() {
        view.addSubview(tableView)
        view.addSubview(createReviewButton)
    }

    func configureView() {
        view.backgroundColor = UIColor.TVShows.appWhite
        extendedLayoutIncludesOpaqueBars = true
    }

    func configureSubviews() {
        headerView.translatesAutoresizingMaskIntoConstraints = false
        tableView.tableHeaderView = headerView
        
        tableView.backgroundColor = UIColor.TVShows.appWhite
        tableView.registerClass(cellOfType: ReviewTableViewCell.self)
        tableView.contentInsetAdjustmentBehavior = .always

        createReviewButton.setTitle("Write a Review", for: .normal)
    }

    func defineConstraints() {
        tableView.contentInsetAdjustmentBehavior = .always
        tableView.snp.makeConstraints {
            $0.top.leading.trailing.equalToSuperview()
        }
        createReviewButton.snp.makeConstraints {
            $0.top.equalTo(tableView.snp.bottom).offset(15)
            $0.leading.trailing.bottom.equalTo(view.safeAreaLayoutGuide).inset(20)
        }
    }
}
