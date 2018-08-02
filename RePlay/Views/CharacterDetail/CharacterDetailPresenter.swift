//
//  CharacterDetailPresenter.swift
//  RePlay
//
//  Created by Bennet van der Linden on 01/08/2018.
//  Copyright (c) 2018 Bennet. All rights reserved.
//

import Foundation
import RxSwift

final class CharacterDetailPresenter: Presenter {

    typealias UseCaseFactory = LoadCharacterDetailsUseCaseFactory

    private let disposeBag = DisposeBag()
    let stateObservable: Observable<CharacterDetailViewState>
    let useCaseFactory: UseCaseFactory
    let characterId: Int

    init(stateObservable: Observable<CharacterDetailViewState>,
         useCaseFactory: UseCaseFactory,
         characterId: Int) {
        self.stateObservable = stateObservable
        self.useCaseFactory = useCaseFactory
        self.characterId = characterId
    }

    weak var view: CharacterDetailView?

    func viewDidLoad() {
        stateObservable
            .subscribe(onNext: { [weak self] characterDetailViewState in
                self?.handleState(characterDetailViewState)
            })
            .disposed(by: disposeBag)
        useCaseFactory.makeCharacterDetailsUseCase(characterId: characterId).start()
    }

    private func handleState(_ characterDetailViewState: CharacterDetailViewState) {
        characterDetailViewState.isLoading ? view?.showLoader() : view?.hideLoader()
        view?.showTitle(characterDetailViewState.character?.name)
    }
}
