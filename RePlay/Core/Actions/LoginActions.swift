//
//  LoginActions.swift
//  RePlay
//
//  Created by Bennet van der Linden on 31/07/2018.
//  Copyright © 2018 Bennet. All rights reserved.
//

import Foundation
import ReSwift

struct UserSession {

    let token: String
    let email: String
}

enum LoginActions {

    public struct LoginSuccess: Action {
        let userSession: UserSession
        init(with userSession: UserSession) {
            self.userSession = userSession
        }
    }

    public struct LoginFailed: Action {
        let error: Error
        init(with error: Error) {
            self.error = error
        }
    }

}
