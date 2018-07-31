//
//  StartUpView.swift
//  RePlay
//
//  Created by Bennet van der Linden on 27/07/2018.
//  Copyright (c) 2018 Bennet. All rights reserved.
//
//

import Foundation

// Presenter -> View
protocol StartUpView: LoaderViewable {
    func showOnboarding()
    func showLogin()
}
