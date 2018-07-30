//
//  StartUpUseCase.swift
//  RePlay
//
//  Created by Bennet van der Linden on 27/07/2018.
//  Copyright © 2018 Bennet. All rights reserved.
//

import Foundation
import ReSwift

class StartUpUseCase: UseCase {

    let actionDispatcher: ActionDispatcher

    init(actionDispatcher: ActionDispatcher) {
        self.actionDispatcher = actionDispatcher
    }

    func start() {
        actionDispatcher.dispatch(StartUpAction.Start())
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.2) {
            self.actionDispatcher.dispatch(StartUpAction.ShowOnboarding())
        }
    }
}