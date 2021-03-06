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
    let remoteAPI: RemoteAPI

    init(reduxStore: Store<AppState>,
         remoteAPI: RemoteAPI) {
        self.reduxStore = reduxStore
        self.remoteAPI = remoteAPI
    }
}

extension CharacterDependencyContainer: CharacterListViewControllerFactory, LoadCharacterListUseCaseFactory {

    func makeCharacterListViewController() -> UIViewController {
        let characterListViewController = CharacterListViewController(presenter: makeCharacterListPresenter(),
                                                                      viewControllerFactory: self)
        return UINavigationController(rootViewController: characterListViewController)
    }

    func makeCharacterListPresenter() -> CharacterListPresenter {
        return CharacterListPresenter(stateObservable: makeCharacterListStateObservable(),
                                      useCaseFactory: self)
    }

    func makeCharacterListStateObservable() -> Observable<CharacterListState> {
        return reduxStore.makeObservable({ $0.characterListState })
    }

    func makeLoadCharacterListUseCase(params: [String: Any]?) -> UseCase {
        return LoadCharacterListUseCase(remoteAPI: remoteAPI,
                                        actionDispatcher: reduxStore,
                                        params: params)
    }
}

extension CharacterDependencyContainer: CharacterDetailViewControllerFactory, LoadCharacterDetailsUseCaseFactory {

    func makeCharacterDetailViewController(for characterId: Int) -> UIViewController {
        return CharacterDetailViewController(presenter: makeCharacterDetailPresenter(for: characterId))
    }

    func makeCharacterDetailPresenter(for characterId: Int) -> CharacterDetailPresenter {
        return CharacterDetailPresenter(stateObservable: makeCharacterDetailStateObservable(),
                                        useCaseFactory: self,
                                        characterId: characterId)
    }

    func makeCharacterDetailStateObservable() -> Observable<CharacterDetailViewState> {
        return reduxStore.makeObservable({ $0.characterDetailViewState })
    }

    func makeLoadCharacterDetailsUseCase(characterId: Int) -> UseCase {
        return LoadCharacterDetailsUseCase(remoteAPI: remoteAPI,
                                           actionDispatcher: reduxStore,
                                           characterId: characterId)
    }
}
