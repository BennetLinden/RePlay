//
//  LoginState.swift
//  RePlay
//
//  Created by Bennet van der Linden on 30/07/2018.
//  Copyright © 2018 Bennet. All rights reserved.
//

import Foundation
import ReSwift

func loginReducer(action: Action, state: LoginState?) -> LoginState {

    switch action {

    default:
        return state ?? LoginState()
    }
}

struct LoginState: StateType, Equatable {

}
