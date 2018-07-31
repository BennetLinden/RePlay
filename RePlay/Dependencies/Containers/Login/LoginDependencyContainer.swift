//
//  LoginDependencyContainer.swift
//  RePlay
//
//  Created by Bennet van der Linden on 30/07/2018.
//  Copyright © 2018 Bennet. All rights reserved.
//

import Foundation
import UIKit
import ReSwift
import RxSwift

final class LoginDependencyContainer: LoginDependencyProvider {

    var reduxStore: Store<AppState>

    init(reduxStore: Store<AppState>) {
        self.reduxStore = reduxStore
    }

    func makeLoginViewController() -> UIViewController {
        return LoginViewController(presenter: makeLoginPresenter())
    }

    func makeLoginPresenter() -> LoginPresenter {
        return LoginPresenter(stateObservable: makeLoginStateObservable(),
                              useCaseFactory: self)
    }

    func makeLoginStateObservable() -> Observable<LoginState> {
        return reduxStore.makeObservable({ $0.loginState })
    }

    func makeLoginUseCase(email: String, password: String) -> UseCase {
        return LoginUseCase(email: email, password: password,
                            actionDispatcher: reduxStore)
    }
}

extension LoginDependencyContainer: LoginViewControllerFactory {}
extension LoginDependencyContainer: LoginUseCaseFactory {}
