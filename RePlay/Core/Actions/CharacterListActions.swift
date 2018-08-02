//
//  CharacterListAction.swift
//  RePlay
//
//  Created by Bennet van der Linden on 31/07/2018.
//  Copyright © 2018 Bennet. All rights reserved.
//

import Foundation
import ReSwift

enum CharacterListAction {

    struct Loading: Action {}

    struct CharactersLoaded: Action {
        let info: PaginationInfo
        let characters: [Character]
    }

    struct LoadingCharactersFailed: Action {
        let error: Error
    }
}
