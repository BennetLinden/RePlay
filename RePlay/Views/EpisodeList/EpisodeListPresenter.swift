//
//  EpisodeListPresenter.swift
//  RePlay
//
//  Created by Bennet van der Linden on 02/08/2018.
//  Copyright (c) 2018 Bennet. All rights reserved.
//

import Foundation
import RxSwift

final class EpisodeListPresenter: Presenter {

    typealias UseCaseFactory = LoadEpisodeListUseCaseFactory

    private let disposeBag = DisposeBag()
    private let stateObservable: Observable<EpisodeListState>
    private let useCaseFactory: UseCaseFactory

    weak var view: EpisodeListView?

    private var episodes: [Episode] = []
    private var paginationInfo: PaginationInfo?

    init(stateObservable: Observable<EpisodeListState>,
         useCaseFactory: UseCaseFactory) {
        self.stateObservable = stateObservable
        self.useCaseFactory = useCaseFactory
    }

    func viewDidLoad() {
        stateObservable
            .subscribe(onNext: { [weak self] episodeListState in
                self?.handleState(episodeListState)
            })
            .disposed(by: disposeBag)
        useCaseFactory.makeLoadEpisodeListUseCase(params: nil).start()
    }

    private func handleState(_ episodeListState: EpisodeListState) {
        episodes = episodeListState.episodes
        paginationInfo = episodeListState.paginationInfo
        view?.showEpisodes(episodes.map { $0.name })
    }

    func didScrollToEnd() {
        guard
            let next = paginationInfo?.next,
            let queryItem = URLComponents(string: next)?.queryItems?.first,
            let nextPage = Int(queryItem.value ?? "")
            else { return }
        let params: [String: Any] = [queryItem.name: nextPage]
        useCaseFactory.makeLoadEpisodeListUseCase(params: params).start()
    }
}
