//
//  OnboardingState.swift
//  RePlay
//
//  Created by Bennet van der Linden on 30/07/2018.
//  Copyright © 2018 Bennet. All rights reserved.
//

import Foundation
import ReSwift

func onboardingReducer(action: Action, state: OnboardingState?) -> OnboardingState {

    let state = state ?? OnboardingState(pages: [], completed: false)

    switch action {
    case _ where action is StartUpAction.ShowOnboarding:
        return OnboardingState(pages: [], completed: false)

    case let action as OnboardingAction.Initialized:
        return OnboardingState(pages: action.pages, completed: false)

    case _ where action is OnboardingAction.Completed:
        return OnboardingState(pages: state.pages, completed: true)

    default:
        return state
    }
}

struct OnboardingState: StateType, Equatable {

    let pages: [String]
    let completed: Bool
}
