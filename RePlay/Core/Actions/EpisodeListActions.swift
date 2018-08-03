//
//  EpisodeListActions.swift
//  RePlay
//
//  Created by Bennet van der Linden on 03/08/2018.
//  Copyright © 2018 Bennet. All rights reserved.
//

import Foundation
import ReSwift

enum EpisodeListAction {

    struct Loading: Action {}

    struct EpisodesLoaded: Action {
        let info: PaginationInfo
        let episodes: [Episode]
    }

    struct LoadingEpisodesFailed: Action {
        let error: Error
    }
}
