//
//  ShowsPresenter.swift
//  iOS-TvShows
//
//  Created by Filip Ban on 23.11.2021..
//  Copyright (c) 2021 ___ORGANIZATIONNAME___. All rights reserved.
//
//  This file was generated by the 🐍 VIPER generator
//

import Foundation
import RxSwift
import RxCocoa

final class ShowsPresenter {

    // MARK: - Private properties -

    private unowned let view: ShowsViewInterface
    private let interactor: ShowsInteractorInterface
    private let wireframe: ShowsWireframeInterface
    private let disposeBag: DisposeBag

    // MARK: - Lifecycle -

    init(
        view: ShowsViewInterface,
        interactor: ShowsInteractorInterface,
        wireframe: ShowsWireframeInterface
    ) {
        self.view = view
        self.interactor = interactor
        self.wireframe = wireframe
        self.disposeBag = DisposeBag()
    }
}

// MARK: - Extensions -

extension ShowsPresenter: ShowsPresenterInterface {

    func configure(with output: Shows.ViewOutput) -> Shows.ViewInput {
        handle(settings: output.settings)
        return Shows.ViewInput(
            shows: shows
        )
    }

    func handle(settings: Signal<Void>) {
        settings
            .emit(onNext: { [unowned self] _ in
                wireframe.goToSettings()
            })
            .disposed(by: disposeBag)
    }

    var shows: Observable<[Show]> {
        interactor
            .shows
            .handleLoadingAndError(with: view)
            .asObservable()
    }

}
