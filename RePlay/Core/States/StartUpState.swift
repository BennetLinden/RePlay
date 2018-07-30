//
//  StartUpState.swift
//  RePlay
//
//  Created by Bennet van der Linden on 27/07/2018.
//  Copyright © 2018 Bennet. All rights reserved.
//

import Foundation
import ReSwift

func startUpReducer(action: Action, state: StartUpState?) -> StartUpState {

    switch action {
    case _ where action is StartUpAction.Start:
        return .starting

    case _ where action is StartUpAction.ShowOnboarding:
        return .onboarding

    case _ where action is StartUpAction.ShowLogin:
        return .login

    case _ where action is StartUpAction.Authenticated:
        return .authenticated

    default:
        return state ?? .starting
    }
}

enum StartUpState: StateType, Equatable {
    case starting
    case onboarding
    case login
    case authenticated
}
