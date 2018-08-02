//
//  AppState.swift
//  ReToedoes
//
//  Created by Bennet van der Linden on 24/07/2018.
//  Copyright © 2018 Bennet. All rights reserved.
//

import ReSwift

struct AppState: StateType, Equatable {
    let startUpState: StartUpState
    let onboardingState: OnboardingState
    let characterListState: CharacterListState
    let characterDetailViewState: CharacterDetailViewState
}
