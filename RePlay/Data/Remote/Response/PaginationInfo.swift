//
//  PaginationInfo.swift
//  RePlay
//
//  Created by Bennet van der Linden on 01/08/2018.
//  Copyright © 2018 Bennet. All rights reserved.
//

import Foundation

struct PaginationInfo: Codable, Equatable {

    let count: Int
    let pages: Int
    let next: String?
    let prev: String?
}
