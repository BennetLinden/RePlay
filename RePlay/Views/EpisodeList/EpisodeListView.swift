//
//  EpisodeListView.swift
//  RePlay
//
//  Created by Bennet van der Linden on 02/08/2018.
//  Copyright (c) 2018 Bennet. All rights reserved.
//
//

import Foundation

// Presenter -> View
protocol EpisodeListView: View {
    func showEpisodes(_ episodes: [String])
}
