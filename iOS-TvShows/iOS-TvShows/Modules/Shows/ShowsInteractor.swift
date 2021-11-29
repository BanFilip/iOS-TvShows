//
//  ShowsInteractor.swift
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

final class ShowsInteractor {

    private let service: APIService
    private let sessionManager: SessionManager

    init(
        service: APIService = APIService.instance,
        sessionManager: SessionManager = .default
    ) {
        self.service = service
        self.sessionManager = sessionManager
    }
}

// MARK: - Extensions -

extension ShowsInteractor: ShowsInteractorInterface {

    typealias Container = [Show]
    typealias Page = ShowsResponse
    typealias PagingEvent = Paging.Event<Container>

    private func shows(with pagination: Pagination?) -> Single<ShowsResponse> {
        var params: [String: Int] = [:]
        if let lastPage = pagination {
            params = [
                "page": lastPage.page + 1,
                "items": lastPage.items
            ]
        }
        return service.rx
            .request(
                ShowsResponse.self,
                router: ShowsRouter.shows(with: params),
                session: sessionManager.session
            )
    }

    func showsPaging(loadNextPage: Driver<Void>, reload: Driver<Void>) -> Observable<[Show]> {
        let events = Driver
            .merge(
                loadNextPage.mapTo(PagingEvent.nextPage),
                reload.startWith(()).mapTo(PagingEvent.reload)
            )

        func nextPage(container: Container, lastPage: Page?) -> Single<Page> {
            return shows(with: lastPage?.pagination)
        }

        func accumulator(_ container: Container, _ page: Page) -> Container {
            return container + page.shows
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
}
