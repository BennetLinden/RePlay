//
//  OnboardingCompletedUseCase.swift
//  RePlay
//
//  Created by Bennet van der Linden on 27/07/2018.
//  Copyright © 2018 Bennet. All rights reserved.
//

import Foundation

final class CompleteOnboardingUseCase: UseCase {

    let actionDispatcher: ActionDispatcher

    init(actionDispatcher: ActionDispatcher) {
        self.actionDispatcher = actionDispatcher
    }

    func start() {
        UserDefaults.standard.set(true, forKey: UserDefaults.Keys.kOnboardingCompleted.rawValue)
        actionDispatcher.dispatch(OnboardingAction.Completed())
    }
}
