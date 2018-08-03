//
//  LoadEpisodeListUseCase.swift
//  RePlay
//
//  Created by Bennet van der Linden on 03/08/2018.
//  Copyright © 2018 Bennet. All rights reserved.
//

import Foundation
import PromiseKit

final class LoadEpisodeListUseCase: UseCase {

    let remoteAPI: RemoteAPI
    let actionDispatcher: ActionDispatcher
    let params: [String: Any]?

    init(remoteAPI: RemoteAPI,
         actionDispatcher: ActionDispatcher,
         params: [String: Any]?) {
        self.remoteAPI = remoteAPI
        self.actionDispatcher = actionDispatcher
        self.params = params
    }

    func start() {
        let endpoint: URL = URL(string: "https://rickandmortyapi.com/api/episode/")!
        firstly {
            remoteAPI.request(Route(.get, endpoint, with: params))
        }.then {
            ResponseMapper<EpisodeListResponse>.map($0)
        }.done { response in
            self.actionDispatcher
                .dispatch(
                    EpisodeListAction.EpisodesLoaded(info: response.info,
                                                         episodes: response.results)
            )
        }.catch { error in
            print(error.localizedDescription)
            self.actionDispatcher.dispatch(EpisodeListAction.LoadingEpisodesFailed(error: error))
        }
    }
}
