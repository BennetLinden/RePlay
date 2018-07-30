//
//  AppReducer.swift
//  ReToedoes
//
//  Created by Bennet van der Linden on 24/07/2018.
//  Copyright © 2018 Bennet. All rights reserved.
//

import ReSwift

func appReducer(action: Action, state: AppState?) -> AppState {
    return AppState(
        startUpState: startUpReducer(action: action, state: state?.startUpState),
        onboardingState: onboardingReducer(action: action, state: state?.onboardingState)
    )
}
