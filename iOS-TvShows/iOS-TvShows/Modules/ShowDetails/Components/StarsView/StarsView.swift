//
//  StarsView.swift
//  iOS-TvShows
//
//  Created by Filip Ban on 30.11.2021..
//

import UIKit
import RxSwift
import RxCocoa

class StarsView: UIView {

    private let stackView = UIStackView()

    private let tapPublishRelay = PublishRelay<Int>()
    private let disposeBag = DisposeBag()


    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
        tapPublishRelay
            .subscribe(onNext: { tag in
                print(tag)
            })
            .disposed(by: disposeBag)
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

    func setupUI() {
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

//        setContentHuggingPriority(.defaultLow, for: .horizontal)
//        translatesAutoresizingMaskIntoConstraints = false
    }

    private func configureSubviews() {
        stackView.axis = .horizontal
        stackView.distribution = .fill
        stackView.isUserInteractionEnabled = false
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
            button.tag = value

            button.rx
                .tap
                .asSignal()
                .map { _ in button.tag }
                .emit(onNext: { [unowned self] tag in
                    tapPublishRelay.accept(tag)
                    configureStars(numOfSelected: tag)
                })
                .disposed(by: disposeBag)
        }
    }
}
