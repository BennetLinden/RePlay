//
//  InitializeOnboardingUseCase.swift
//  RePlay
//
//  Created by Bennet van der Linden on 30/07/2018.
//  Copyright © 2018 Bennet. All rights reserved.
//

import Foundation
import ReSwift

class InitializeOnboardingUseCase: UseCase {

    let actionDispatcher: ActionDispatcher

    init(actionDispatcher: ActionDispatcher) {
        self.actionDispatcher = actionDispatcher
    }

    func start() {
        let pages = ["Page 1",
                     "Page 2",
                     "Page 3",
                     "Page 4"]
        DispatchQueue.main.async {
            self.actionDispatcher.dispatch(OnboardingAction.Initialized(pages: pages))
        }
    }
}
