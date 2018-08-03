//
//  EpisodeListResponse.swift
//  RePlay
//
//  Created by Bennet van der Linden on 03/08/2018.
//  Copyright © 2018 Bennet. All rights reserved.
//

import Foundation

struct EpisodeListResponse: Codable {
    let info: PaginationInfo
    let results: [Episode]
}
