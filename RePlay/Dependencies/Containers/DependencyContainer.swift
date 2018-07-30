//
//  DependencyContainer.swift
//  ReToedoes
//
//  Created by Bennet van der Linden on 25/07/2018.
//  Copyright © 2018 Bennet. All rights reserved.
//

import Foundation
import UIKit
import ReSwift
import RxSwift

final class DependencyContainer: DependencyProvider {

    let reduxStore: Store<AppState> = Store<AppState>(reducer: appReducer, state: nil)

    func makeOnboardingDependencyContainer() -> OnboardingDependencyContainer {
        return OnboardingDependencyContainer(reduxStore: reduxStore)
    }

    func makeStartUpViewController() -> UIViewController {
        return StartUpViewController(presenter: makeStartUpPresenter(),
                                     onboardingViewControllerFactory: makeOnboardingDependencyContainer())
    }

    func makeStartUpPresenter() -> StartUpPresenter {
        return StartUpPresenter(stateObservable: makeStartUpStateObservable(),
                                useCaseFactory: self)
    }

    func makeStartUpStateObservable() -> Observable<StartUpState> {
        return reduxStore.makeObservable({ $0.startUpState })
    }

    func makeStartUpUseCase() -> UseCase {
        return StartUpUseCase(actionDispatcher: reduxStore)
    }
}

extension DependencyContainer: StartUpViewControllerFactory {}
extension DependencyContainer: StartUpUseCaseFactory {}
