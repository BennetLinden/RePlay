//
//  LoginUseCase.swift
//  RePlay
//
//  Created by Bennet van der Linden on 30/07/2018.
//  Copyright © 2018 Bennet. All rights reserved.
//

import Foundation

class LoginUseCase: UseCase {

    private let email: String
    private let password: String
    let actionDispatcher: ActionDispatcher

    init(email: String,
         password: String,
         actionDispatcher: ActionDispatcher) {
        self.email = email
        self.password = password
        self.actionDispatcher = actionDispatcher
    }

    func start() {
        // Do some networking, return usersession from login API call
        
        
        
        let userSession = UserSession(token: "123", email: "abc@def.nl")
        actionDispatcher.dispatch(LoginActions.LoginSuccess(with: userSession))
    }
}
