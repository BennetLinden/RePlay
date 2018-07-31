//
//  LoginPresenter.swift
//  RePlay
//
//  Created by Bennet van der Linden on 30/07/2018.
//  Copyright (c) 2018 Bennet. All rights reserved.
//

import Foundation
import RxSwift

final class LoginPresenter: Presenter {

    typealias UseCaseFactory = LoginUseCaseFactory

    private let disposeBag = DisposeBag()
    private let stateObservable: Observable<LoginState>
    private let useCaseFactory: UseCaseFactory

    weak var view: LoginView?

    init(stateObservable: Observable<LoginState>,
         useCaseFactory: UseCaseFactory) {
        self.stateObservable = stateObservable
        self.useCaseFactory = useCaseFactory
    }

    func viewDidLoad() {
        stateObservable
            .subscribe(onNext: { [unowned self] state in
                self.handleState(state)
            })
            .disposed(by: disposeBag)
    }

    private func handleState(_ loginState: LoginState) {
        print("loginState: \(loginState)")
    }

    func submitLogin(email: String, password: String) {
        useCaseFactory
            .makeLoginUseCase(email: email, password: password)
            .start()
    }
}
