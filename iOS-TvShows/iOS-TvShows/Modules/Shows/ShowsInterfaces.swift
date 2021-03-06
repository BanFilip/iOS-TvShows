//
//  ShowsInterfaces.swift
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

protocol ShowsWireframeInterface: WireframeInterface {
    func goToSettings()
    func goToShowDetails(with id: String)
}

protocol ShowsViewInterface: ViewInterface, Progressable {
}

protocol ShowsPresenterInterface: PresenterInterface {
    func configure(with output: Shows.ViewOutput) -> Shows.ViewInput
}

protocol ShowsInteractorInterface: InteractorInterface {
    func showsPaging(loadNextPage: Driver<Void>, reload: Driver<Void>) -> Observable<[Show]>
}

enum Shows {

    struct ViewOutput {
        let settings: Signal<Void>
        let pullToRefresh: Driver<Void>
        let willDisplayLastCell: Driver<Void>
    }

    struct ViewInput {
        let shows: Driver<[TableCellItem]>
    }

}
