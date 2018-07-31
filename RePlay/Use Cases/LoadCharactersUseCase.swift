//
//  LoadCharactersUseCase.swift
//  RePlay
//
//  Created by Bennet van der Linden on 31/07/2018.
//  Copyright © 2018 Bennet. All rights reserved.
//

import Foundation
import PromiseKit

final class LoadCharactersUseCase: UseCase {

    let remoteAPI: RemoteAPI
    let actionDispatcher: ActionDispatcher

    init(remoteAPI: RemoteAPI,
         actionDispatcher: ActionDispatcher) {
        self.remoteAPI = remoteAPI
        self.actionDispatcher = actionDispatcher
    }

    func start() {
        let endpoint = "https://rickandmortyapi.com/api/character/"
        firstly {
            remoteAPI.request(Route(.get, endpoint))
        }.then {
            ResponseMapper<CharacterListResponse>.map($0)
        }.done { [weak self] response in
            self?.actionDispatcher.dispatch(CharacterListAction.CharactersLoaded(characters: response.results))
        }.catch { [weak self] error in
            print(error.localizedDescription)
            self?.actionDispatcher.dispatch(CharacterListAction.LoadingCharactersFailed(error: error))
        }
    }
}
