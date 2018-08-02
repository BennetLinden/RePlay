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
    let params: [String: Any]?

    init(remoteAPI: RemoteAPI,
         actionDispatcher: ActionDispatcher,
         params: [String: Any]?) {
        self.remoteAPI = remoteAPI
        self.actionDispatcher = actionDispatcher
        self.params = params
    }

    func start() {
        let endpoint: URL = URL(string: "https://rickandmortyapi.com/api/character/")!
        firstly {
            remoteAPI.request(Route(.get, endpoint, with: params))
            }.then {
                ResponseMapper<CharacterListResponse>.map($0)
            }.done { response in
                self.actionDispatcher
                    .dispatch(
                        CharacterListAction.CharactersLoaded(info: response.info,
                                                             characters: response.results)
                )
            }.catch { error in
                print(error.localizedDescription)
                self.actionDispatcher.dispatch(CharacterListAction.LoadingCharactersFailed(error: error))
        }
    }
}
