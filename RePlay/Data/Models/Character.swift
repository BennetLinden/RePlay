//
//  Character.swift
//  RePlay
//
//  Created by Bennet van der Linden on 31/07/2018.
//  Copyright © 2018 Bennet. All rights reserved.
//

import Foundation

struct Character: Codable, Equatable {

    let id: Int
    let name: String
    let status: String
    let species: String
    let type: String?
    let gender: String
    let imageURL: URL

    enum CodingKeys: String, CodingKey {
        case id, name, status, species, type, gender
        case imageURL = "image"
    }
}
