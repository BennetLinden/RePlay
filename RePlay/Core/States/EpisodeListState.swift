//
//  EpisodeListState.swift
//  RePlay
//
//  Created by Bennet van der Linden on 02/08/2018.
//  Copyright © 2018 Bennet. All rights reserved.
//

import Foundation
import ReSwift

func episodeListReducer(action: Action, state: EpisodeListState?) -> EpisodeListState {

    let state = state ?? EpisodeListState(paginationInfo: nil, episodes: [])
    switch action {
    case let action as EpisodeListAction.EpisodesLoaded:
        let episodes = state.episodes + action.episodes
        return EpisodeListState(paginationInfo: action.info, episodes: episodes)
    default:
        return state
    }
}

struct EpisodeListState: StateType, Equatable {
    let paginationInfo: PaginationInfo?
    let episodes: [Episode]

}
