//
//  CharacterDetailViewState.swift
//  RePlay
//
//  Created by Bennet van der Linden on 01/08/2018.
//  Copyright © 2018 Bennet. All rights reserved.
//

import Foundation
import ReSwift

func characterDetailViewStateReducer(action: Action, state: CharacterDetailViewState?) -> CharacterDetailViewState {

    let state = state ?? CharacterDetailViewState(isLoading: false, character: nil)
    switch action {
    case _ where action is CharacterDetailAction.CharacterLoading:
        return CharacterDetailViewState(isLoading: true, character: nil)

    case let action as CharacterDetailAction.CharacterLoaded:
        return CharacterDetailViewState(isLoading: false, character: action.character)

    default:
        return state
    }
}

struct CharacterDetailViewState: StateType, Equatable {
    let isLoading: Bool
    let character: Character?
}
