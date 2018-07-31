//
//  DependencyProvider.swift
//  ReToedoes
//
//  Created by Bennet van der Linden on 25/07/2018.
//  Copyright © 2018 Bennet. All rights reserved.
//

import Foundation
import UIKit
import ReSwift
import RxSwift

protocol DependencyProvider {

    var reduxStore: Store<AppState> { get }

    func makeOnboardingDependencyContainer() -> OnboardingDependencyContainer
    func makeLoginDependencyContainer() -> LoginDependencyContainer

    func makeStartUpViewController() -> UIViewController
    func makeStartUpPresenter() -> StartUpPresenter
    func makeStartUpStateObservable() -> Observable<StartUpState>
    func makeStartUpUseCase() -> UseCase

}
