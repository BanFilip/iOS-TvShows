//
//  ShowDetailsHeaderView.swift
//  iOS-TvShows
//
//  Created by Filip Ban on 29.11.2021..
//

import UIKit

class ShowDetailsHeaderView: UIView {

    private let stackView = UIStackView()
    private let imageView = UIImageView()
    private let descriptionLabel = UILabel(with: UIFont.systemFont(ofSize: 17))
    private let reviewTitleLabel = UILabel(with: UIFont.boldSystemFont(ofSize: 24))
    private let averageScoreLabel = UILabel(with: UIFont.systemFont(ofSize: 14))
    private let starsView = StarsView()

    init() {
        super.init(frame: .zero)
        setupUI()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupUI()
    }

    func configure(with model: Show) {
        let placeholderImage = UIImage.TVShows.Icons.showPlaceholder
        imageView.kf.setImage(
            with: model.imageUrl.flatMap(URL.init),
            placeholder: placeholderImage
        )
        descriptionLabel.text = model.description
        if let averageRating = model.averageRating {
            averageScoreLabel.text = "\(model.noOfReviews) REVIEWS, \(averageRating) AVERAGE"
            let rating = Int(round(averageRating))
            starsView.configureStars(numOfSelected: rating)
        }
    }
}

private extension ShowDetailsHeaderView {

    func setupUI() {
        addSubviews()
        configureView()
        configureSubviews()
        defineConstraints()
    }

    func addSubviews() {
        addSubview(stackView)
        stackView.addArrangedSubview(imageView)
        stackView.addArrangedSubview(descriptionLabel)
        stackView.addArrangedSubview(reviewTitleLabel)
        stackView.addArrangedSubview(averageScoreLabel)
        addSubview(starsView)
    }

    func configureView() {
        backgroundColor = UIColor.TVShows.appWhite
    }

    func configureSubviews() {
        stackView.axis = .vertical
        stackView.spacing = 20

        imageView.clipsToBounds = true
        imageView.contentMode = .scaleAspectFill
        imageView.roundAllCorners(withRadius: 10)

        descriptionLabel.numberOfLines = 0
        descriptionLabel.textColor = .black

        reviewTitleLabel.text = "Reviews"
        reviewTitleLabel.textAlignment = .left
        reviewTitleLabel.textColor = .black

        averageScoreLabel.textAlignment = .left
        averageScoreLabel.textColor = UIColor.TVShows.appDarkGrey
    }

    func defineConstraints() {
        stackView.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.leading.trailing.equalToSuperview().inset(20)
        }

        imageView.snp.makeConstraints {
            $0.size.equalTo(CGSize(width: 350, height: 350))
        }

        starsView.snp.makeConstraints {
            $0.top.equalTo(stackView.snp.bottom).offset(10)
            $0.leading.equalToSuperview().inset(20)
            $0.bottom.equalToSuperview().inset(16)
        }
    }
}
