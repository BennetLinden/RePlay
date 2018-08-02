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

    private var paginationInfo: PaginationInfo?
    private var characters: [Character] = []

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

        useCaseFactory.makeLoadCharactersUseCase(params: nil).start()
    }

    private func handleState(_ characterListState: CharacterListState) {
        paginationInfo = characterListState.info
        characters = characterListState.characters
        view?.showCharacters(characters.map({ $0.name }))
    }

    func didScrollToEnd() {
        guard
            let next = paginationInfo?.next,
            let queryItem = URLComponents(string: next)?.queryItems?.first,
            let nextPage = Int(queryItem.value ?? "")
            else { return }
        let params: [String: Any] = [queryItem.name: nextPage]
        useCaseFactory.makeLoadCharactersUseCase(params: params).start()
    }

    func didSelectRow(with index: Int) {
        let characterId = characters[index].id
        view?.showCharacterDetails(for: characterId)
    }
}
