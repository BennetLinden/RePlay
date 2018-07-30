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

    switch action {
    case _ where action is StartUpAction.ShowOnboarding:
        return OnboardingState(completed: false)

    case _ where action is OnboardingAction.Completed:
        return OnboardingState(completed: true)

    default:
        return state ?? OnboardingState(completed: false)
    }
}

struct OnboardingState: StateType, Equatable {

    let completed: Bool
}
