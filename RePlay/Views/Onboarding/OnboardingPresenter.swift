//
//  OnboardingPresenter.swift
//  RePlay
//
//  Created by Bennet van der Linden on 27/07/2018.
//  Copyright (c) 2018 Bennet. All rights reserved.
//

import Foundation
import RxSwift

final class OnboardingPresenter: Presenter {

    typealias UseCaseFactory = OnboardingUseCaseFactory

    private let disposeBag = DisposeBag()
    let stateObservable: Observable<OnboardingState>
    let useCaseFactory: UseCaseFactory

    weak var view: OnboardingView?

    init(stateObservable: Observable<OnboardingState>,
         useCaseFactory: UseCaseFactory) {
        self.stateObservable = stateObservable
        self.useCaseFactory = useCaseFactory
    }

    func viewDidLoad() {
        stateObservable
            .subscribe(onNext: { [unowned self] onboardingState in
                self.handleState(onboardingState)
            })
            .disposed(by: disposeBag)
        let initializeUseCase = useCaseFactory.makeInitializeOnboardingUseCase()
        initializeUseCase.start()
    }

    private func handleState(_ onboardingState: OnboardingState) {
        print("onboardingState: \(onboardingState)")
        if onboardingState.completed {
            view?.dismiss()
            return
        }
        view?.showPages(onboardingState.pages)
    }

    func completeButtonPressed() {
        let useCase = useCaseFactory.makeCompleteOnboardingUseCase()
        useCase.start()
    }

    deinit {
        print("deleted OnboardingPresenter")
    }
}
