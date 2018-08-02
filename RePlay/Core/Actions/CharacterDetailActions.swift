//
//  CharacterDetailAction.swift
//  RePlay
//
//  Created by Bennet van der Linden on 02/08/2018.
//  Copyright © 2018 Bennet. All rights reserved.
//

import Foundation
import ReSwift

enum CharacterDetailAction {

    struct Loading: Action {}

    struct CharacterLoaded: Action {
        let character: Character
    }

    struct LoadingCharacterFailed: Action {
        let error: Error
    }
}
