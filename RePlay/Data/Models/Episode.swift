//
//  Episode.swift
//  RePlay
//
//  Created by Bennet van der Linden on 03/08/2018.
//  Copyright © 2018 Bennet. All rights reserved.
//

import Foundation

struct Episode: Codable, Equatable {

    let id: Int
    let name: String
    let episode: String
    let airDate: String
}
