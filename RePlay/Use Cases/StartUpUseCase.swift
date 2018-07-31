//
//  StartUpUseCase.swift
//  RePlay
//
//  Created by Bennet van der Linden on 27/07/2018.
//  Copyright © 2018 Bennet. All rights reserved.
//

import Foundation
import ReSwift

final class StartUpUseCase: UseCase {

    let actionDispatcher: ActionDispatcher

    init(actionDispatcher: ActionDispatcher) {
        self.actionDispatcher = actionDispatcher
    }

    func start() {
        actionDispatcher.dispatch(StartUpAction.Start())

        if shouldShowOnboarding() {
            DispatchQueue.main.asyncAfter(deadline: .now() + 2.2) {
                self.actionDispatcher.dispatch(StartUpAction.ShowOnboarding())
            }
            return
        }
        actionDispatcher.dispatch(StartUpAction.Completed())
    }

    private func shouldShowOnboarding() -> Bool {
        return UserDefaults.standard.bool(forKey: UserDefaults.Keys.kOnboardingCompleted.rawValue) == false
    }

}
