//
//  OnboardingDependencyContainer.swift
//  RePlay
//
//  Created by Bennet van der Linden on 27/07/2018.
//  Copyright © 2018 Bennet. All rights reserved.
//

import Foundation
import UIKit
import ReSwift
import RxSwift

class OnboardingDependencyContainer: OnboardingDependencyProvider {

    let reduxStore: Store<AppState>

    required init(reduxStore: Store<AppState>) {
        self.reduxStore = reduxStore
    }

    func makeOnboardingViewController() -> UIViewController {
        return OnboardingViewController(presenter: makeOnboardingPresenter())
    }

    func makeOnboardingPresenter() -> OnboardingPresenter {
        return OnboardingPresenter(stateObservable: makeOnboardingStateObservable(),
                                   useCaseFactory: self)
    }

    func makeOnboardingStateObservable() -> Observable<OnboardingState> {
        return reduxStore.makeObservable { $0.onboardingState }
    }

    func makeInitializeOnboardingUseCase() -> UseCase {
        return InitializeOnboardingUseCase(actionDispatcher: reduxStore)
    }

    func makeCompleteOnboardingUseCase() -> UseCase {
        return CompleteOnboardingUseCase(actionDispatcher: reduxStore)
    }
}

extension OnboardingDependencyContainer: OnboardingViewControllerFactory {}
extension OnboardingDependencyContainer: OnboardingUseCaseFactory {}
