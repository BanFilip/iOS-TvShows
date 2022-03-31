//
//  StarsView.swift
//  iOS-TvShows
//
//  Created by Filip Ban on 30.11.2021..
//

import UIKit
import RxCocoa

class StarsView: UIView {

    let tapBehaviorRelay = BehaviorRelay<Int?>(value: nil)

    private let stackView = UIStackView()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupUI()
    }

    func configureStars(numOfSelected: Int) {
        guard let stars = stackView.arrangedSubviews as? [UIButton] else { return }
        stars.forEach { $0.isSelected = $0.tag <= numOfSelected ? true : false }
    }
}

extension StarsView {

    private func setupUI() {
        addSubviews()
        configureView()
        configureSubviews()
        defineConstraints()
    }

    private func addSubviews() {
        addSubview(stackView)
        makeStarButtons()
    }

    private func configureView() {
        backgroundColor = .clear
        isUserInteractionEnabled = false
    }

    private func configureSubviews() {
        stackView.axis = .horizontal
        stackView.distribution = .fill
    }

    private func defineConstraints() {
        stackView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }

    private func makeStarButtons() {
        (1...5).forEach { value in
            let button = UIButton()
            stackView.addArrangedSubview(button)

            button.setImage(UIImage.TVShows.Icons.starDeselected, for: .normal)
            button.setImage(UIImage.TVShows.Icons.starSelected, for: .selected)
            button.setImage(UIImage.TVShows.Icons.starSelected, for: .highlighted)
            button.addTarget(self, action: #selector(onStarTapped), for: .touchUpInside)
            button.adjustsImageWhenHighlighted = false
            button.tag = value
        }
    }

    @objc
    private func onStarTapped(_ sender: UIButton) {
        tapBehaviorRelay.accept(sender.tag)
        configureStars(numOfSelected: sender.tag)
    }
}
