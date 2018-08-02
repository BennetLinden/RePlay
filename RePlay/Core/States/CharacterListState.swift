//
//  CharacterListState.swift
//  RePlay
//
//  Created by Bennet van der Linden on 31/07/2018.
//  Copyright © 2018 Bennet. All rights reserved.
//

import Foundation
import ReSwift

func characterListReducer(action: Action, state: CharacterListState?) -> CharacterListState {

    let state = state ?? CharacterListState(info: nil, characters: [])
    switch action {
    case let action as CharacterListAction.CharactersLoaded:
        let characters = state.characters + action.characters
        return CharacterListState(info: action.info, characters: characters)

//    case let action as CharacterListAction.LoadingCharactersFailed:
//        return CharacterListState(characters: state.characters, error: action.error)

    default:
        return state
    }
}

struct CharacterListState: StateType, Equatable {
    let info: PaginationInfo?
    let characters: [Character]

}
