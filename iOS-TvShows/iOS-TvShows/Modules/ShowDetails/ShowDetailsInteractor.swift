//
//  ShowDetailsInteractor.swift
//  iOS-TvShows
//
//  Created by Filip Ban on 24.11.2021..
//  Copyright (c) 2021 ___ORGANIZATIONNAME___. All rights reserved.
//
//  This file was generated by the 🐍 VIPER generator
//

import Foundation
import RxSwift
import RxCocoa

final class ShowDetailsInteractor {

    private let identifier: String
    private let service: APIService
    private let sessionManager: SessionManager

    init(
        identifier: String,
        service: APIService = APIService.instance,
        sessionManager: SessionManager = .default
    ) {
        self.identifier = identifier
        self.service = service
        self.sessionManager = sessionManager
    }
}

// MARK: - Extensions -

extension ShowDetailsInteractor: ShowDetailsInteractorInterface {

    func fetchShow() -> Single<Show> {
        service.rx
            .request(
                ShowResponse.self,
                router: ShowsRouter.show(with: identifier),
                session: sessionManager.session
            )
            .map { $0.show }
    }
}

extension ShowDetailsInteractor {

    typealias Container = [Review]
    typealias Page = ReviewsResponse
    typealias PagingEvent = Paging.Event<Container>

    func reviewsPaging(loadNextPage: Driver<Void>, reload: Driver<Void>) -> Observable<[Review]> {
        let events = Driver
            .merge(
                loadNextPage.mapTo(PagingEvent.nextPage),
                reload.startWith(()).mapTo(PagingEvent.reload)
            )

        func nextPage(container: Container, lastPage: Page?) -> Single<Page> {
            return reviews(with: lastPage?.pagination)
        }

        func accumulator(_ container: Container, _ page: Page) -> Container {
            return container + page.reviews
        }

        func hasNext(container: Container, lastPage: Page) -> Bool {
            return lastPage.pagination.page < lastPage.pagination.pages
        }

        return Paging
            .page(
                make: nextPage,
                startingWith: [],
                joining: accumulator,
                while: hasNext,
                on: events.asObservable()
            )
            .map { $0.container }
    }

    private func reviews(with pagination: Pagination?) -> Single<ReviewsResponse> {
        var params: [String: Int] = [:]
        if let lastPage = pagination {
            params = [
                "page": lastPage.page + 1,
                "items": lastPage.items
            ]
        }
        return service.rx
            .request(
                ReviewsResponse.self,
                router: ReviewRouter.reviews(with: identifier, params: params),
                session: sessionManager.session
            )
    }
}

