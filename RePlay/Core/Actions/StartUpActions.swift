//
//  StartUpActions.swift
//  RePlay
//
//  Created by Bennet van der Linden on 27/07/2018.
//  Copyright © 2018 Bennet. All rights reserved.
//

import Foundation
import ReSwift

enum StartUpAction {

    public struct Start: Action {}
    public struct ShowOnboarding: Action {}
    public struct ShowLogin: Action {}
    public struct Authenticated: Action {}
}
