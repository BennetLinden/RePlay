//
//  OnboardingDependencyProvider.swift
//  RePlay
//
//  Created by Bennet van der Linden on 27/07/2018.
//  Copyright © 2018 Bennet. All rights reserved.
//

import Foundation
import UIKit
import ReSwift
import RxSwift

protocol OnboardingDependencyProvider {

    var reduxStore: Store<AppState> { get }

    init(reduxStore: Store<AppState>)

    func makeOnboardingViewController() -> UIViewController
    func makeOnboardingPresenter() -> OnboardingPresenter
    func makeOnboardingStateObservable() -> Observable<OnboardingState>
    func makeCompleteOnboardingUseCase() -> UseCase

}
