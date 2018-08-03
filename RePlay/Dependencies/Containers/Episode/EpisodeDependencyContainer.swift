//
//  EpisodeDependencyContainer.swift
//  RePlay
//
//  Created by Bennet van der Linden on 02/08/2018.
//  Copyright (c) 2018 Bennet. All rights reserved.
//
//

import Foundation
import UIKit
import ReSwift
import RxSwift

final class EpisodeDependencyContainer: EpisodeDependencyProvider {

    let reduxStore: Store<AppState>
    let remoteAPI: RemoteAPI

    init(reduxStore: Store<AppState>,
         remoteAPI: RemoteAPI) {
        self.reduxStore = reduxStore
        self.remoteAPI = remoteAPI
    }
}

extension EpisodeDependencyContainer: EpisodeListViewControllerFactory, LoadEpisodeListUseCaseFactory {

    func makeEpisodeListViewController() -> UIViewController {
        let episodeListViewController = EpisodeListViewController(presenter: makeEpisodeListPresenter())
        return UINavigationController(rootViewController: episodeListViewController)
    }

    func makeEpisodeListPresenter() -> EpisodeListPresenter {
        return EpisodeListPresenter(stateObservable: makeEpisodeListStateObservable(),
                                    useCaseFactory: self)
    }

    func makeEpisodeListStateObservable() -> Observable<EpisodeListState> {
        return reduxStore.makeObservable({ $0.episodeListState })
    }

    func makeLoadEpisodeListUseCase(params: [String: Any]?) -> UseCase {
        return LoadEpisodeListUseCase(remoteAPI: remoteAPI,
                                      actionDispatcher: reduxStore,
                                      params: params)
    }
}
