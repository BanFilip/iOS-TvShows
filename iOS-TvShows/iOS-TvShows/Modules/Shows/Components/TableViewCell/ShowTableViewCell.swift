//
//  ShowTableViewCell.swift
//  iOS-TvShows
//
//  Created by Filip Ban on 24.11.2021..
//

import UIKit
import Kingfisher
import RxCocoa

struct ShowTableCellItem: TableCellItem {
    let show: Show
    let didSelect: ((ShowTableCellItem) -> Void)?
}

extension ShowTableCellItem {
    func cell(from tableView: UITableView, at indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(ofType: ShowTableViewCell.self, for: indexPath)
        cell.configure(with: show)
        return cell
    }

    var height: CGFloat {
        114
    }

    func didSelect(at indexPath: IndexPath) {
        didSelect?(self)
    }
}

class ShowTableViewCell: UITableViewCell {

    private let customImageView = UIImageView()
    private let label = UILabel()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupUI()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupUI()
    }

    func configure(with item: Show) {
        let placeholderImage = UIImage.TVShows.Icons.showPlaceholder
        label.text = item.title
        customImageView.kf.setImage(
            with: item.imageUrl.flatMap(URL.init),
            placeholder: placeholderImage
        )
    }
}

private extension ShowTableViewCell {

    func setupUI() {
        addSubviews()
        configureView()
        configureSubviews()
        defineConstraints()
    }

    func addSubviews() {
        contentView.addSubview(customImageView)
        contentView.addSubview(label)
    }

    func configureView() {
        backgroundColor = UIColor.TVShows.appWhite
    }

    func configureSubviews() {
        customImageView.clipsToBounds = true
        customImageView.roundAllCorners(withRadius: 4)
    }

    func defineConstraints() {
        customImageView.snp.makeConstraints {
            $0.size.equalTo(CGSize(width: 64, height: 90))
            $0.centerY.equalToSuperview()
            $0.leading.equalToSuperview().inset(16)
        }

        label.snp.makeConstraints {
            $0.leading.equalTo(customImageView.snp.trailing).offset(24)
            $0.trailing.equalToSuperview().inset(24)
            $0.centerY.equalToSuperview()
        }
    }
}
