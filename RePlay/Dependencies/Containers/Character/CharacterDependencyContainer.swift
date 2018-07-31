//
//  CharacterDependencyContainer.swift
//  RePlay
//
//  Created by Bennet van der Linden on 31/07/2018.
//  Copyright © 2018 Bennet. All rights reserved.
//

import Foundation
import UIKit
import ReSwift
import RxSwift

final class CharacterDependencyContainer: CharacterDependencyProvider {

    let reduxStore: Store<AppState>
    let remoteAPI = RemoteAPI()

    init(reduxStore: Store<AppState>) {
        self.reduxStore = reduxStore
    }

    func makeCharacterListViewController() -> UIViewController {
        return CharacterListViewController(presenter: makeCharacterListPresenter())
    }

    func makeCharacterListPresenter() -> CharacterListPresenter {
        return CharacterListPresenter(stateObservable: makeCharacterListStateObservable(),
                                      useCaseFactory: self)
    }

    func makeCharacterListStateObservable() -> Observable<CharacterListState> {
        return reduxStore.makeObservable({ $0.characterListState })
    }

    func makeLoadCharactersUseCase() -> UseCase {
        return LoadCharactersUseCase(remoteAPI: remoteAPI,
                                     actionDispatcher: reduxStore)
    }
}

extension CharacterDependencyContainer: CharacterListViewControllerFactory {}
extension CharacterDependencyContainer: LoadCharactersUseCaseFactory {}
