//
//  ReviewTableViewCell.swift
//  iOS-TvShows
//
//  Created by Filip Ban on 29.11.2021..
//

import UIKit
import Kingfisher
import RxCocoa

struct ReviewTableCellItem: TableCellItem {
    let review: Review
}

extension ReviewTableCellItem {
    func cell(from tableView: UITableView, at indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(ofType: ReviewTableViewCell.self, for: indexPath)
        cell.configure(with: review)
        return cell
    }

    var height: CGFloat {
        140
    }
}

class ReviewTableViewCell: UITableViewCell {

    private let profileImageView = UIImageView()
    private let emailLabel = UILabel(with: UIFont.systemFont(ofSize: 14))
    private let starsView = StarsView()
    private let commentLabel = UILabel(with: UIFont.systemFont(ofSize: 17))

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupUI()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupUI()
    }

    func configure(with item: Review) {
        let placeholderImage = UIImage.TVShows.Icons.showPlaceholder
        emailLabel.text = item.user.email
        profileImageView.kf.setImage(
            with: item.user.imageUrl.flatMap(URL.init),
            placeholder: placeholderImage
        )
        starsView.configureStars(numOfSelected: item.rating)
        commentLabel.text = item.comment
    }
}

private extension ReviewTableViewCell {

    func setupUI() {
        addSubviews()
        configureView()
        configureSubviews()
        defineConstraints()
    }

    func addSubviews() {
        contentView.addSubview(profileImageView)
        contentView.addSubview(emailLabel)
        contentView.addSubview(starsView)
        contentView.addSubview(commentLabel)
    }

    func configureView() {
        backgroundColor = UIColor.TVShows.appWhite
        selectionStyle = .none
    }

    func configureSubviews() {
        profileImageView.clipsToBounds = true
        profileImageView.roundAllCorners(withRadius: 25)

        emailLabel.textColor = UIColor.TVShows.appDarkGrey
        emailLabel.textAlignment = .left

        commentLabel.numberOfLines = 0
        commentLabel.textColor = .black
    }

    func defineConstraints() {
        profileImageView.snp.makeConstraints {
            $0.size.equalTo(CGSize(width: 50, height: 50))
            $0.top.equalToSuperview().inset(16)
            $0.leading.equalToSuperview().inset(20)
        }

        emailLabel.snp.makeConstraints {
            $0.top.equalToSuperview().inset(16)
            $0.leading.equalTo(profileImageView.snp.trailing).offset(16)
            $0.trailing.equalToSuperview()
        }

        starsView.snp.makeConstraints {
            $0.top.equalTo(emailLabel.snp.bottom).offset(10)
            $0.leading.equalTo(profileImageView.snp.trailing).offset(16)
        }

        commentLabel.snp.makeConstraints {
            $0.top.equalTo(profileImageView.snp.bottom).offset(16)
            $0.leading.trailing.equalToSuperview().inset(20)
            $0.bottom.equalToSuperview().inset(16)
        }
    }
}

