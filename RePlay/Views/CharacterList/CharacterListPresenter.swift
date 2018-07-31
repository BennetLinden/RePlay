//
//  CharacterListPresenter.swift
//  RePlay
//
//  Created by Bennet van der Linden on 31/07/2018.
//  Copyright (c) 2018 Bennet. All rights reserved.
//

import Foundation
import RxSwift

final class CharacterListPresenter: Presenter {

    typealias UseCaseFactory = LoadCharactersUseCaseFactory

    private let disposeBag = DisposeBag()
    let stateObservable: Observable<CharacterListState>
    let useCaseFactory: UseCaseFactory

    weak var view: CharacterListView?

    init(stateObservable: Observable<CharacterListState>,
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
        let loadCharactersUseCase = useCaseFactory.makeLoadCharactersUseCase()
        loadCharactersUseCase.start()
    }

    private func handleState(_ characterListState: CharacterListState) {
        print("characterListState \(characterListState)")
        view?.showCharacters(characterListState.characters.map({ $0.name }))
    }
}
