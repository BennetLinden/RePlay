//
//  StartUpPresenter.swift
//  RePlay
//
//  Created by Bennet van der Linden on 27/07/2018.
//  Copyright (c) 2018 Bennet. All rights reserved.
//

import Foundation
import RxSwift

final class StartUpPresenter: Presenter {

    typealias UseCaseFactory = StartUpUseCaseFactory

    private let disposeBag = DisposeBag()
    private let stateObservable: Observable<StartUpState>
    private let useCaseFactory: UseCaseFactory

    weak var view: StartUpView?

    init(stateObservable: Observable<StartUpState>,
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

    func viewDidAppear() {
        let startUpUseCase = useCaseFactory.makeStartUpUseCase()
        startUpUseCase.start()
    }

    private func handleState(_ startUpState: StartUpState) {
        print("startUpState: \(startUpState)")
        switch startUpState {
        case .starting:
            view?.showLoader()

        case .onboarding:
            view?.hideLoader()
            view?.showOnboarding()

        case .login:
            view?.hideLoader()
            view?.showLogin()

        case .authenticated:
            view?.hideLoader()
        }
    }
}
