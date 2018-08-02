//
//  LoadCharacterDetailsUseCase.swift
//  RePlay
//
//  Created by Bennet van der Linden on 01/08/2018.
//  Copyright © 2018 Bennet. All rights reserved.
//

import Foundation
import PromiseKit

final class LoadCharacterDetailsUseCase: UseCase {

    let remoteAPI: RemoteAPI
    let actionDispatcher: ActionDispatcher
    let characterId: Int

    init(remoteAPI: RemoteAPI,
         actionDispatcher: ActionDispatcher,
         characterId: Int) {
        self.remoteAPI = remoteAPI
        self.actionDispatcher = actionDispatcher
        self.characterId = characterId
    }

    func start() {
        actionDispatcher.dispatch(CharacterDetailAction.CharacterLoading())
        let endpoint: URL = URL(string: "https://rickandmortyapi.com/api/character/\(characterId)")!
        firstly {
            remoteAPI.request(Route(.get, endpoint))
            }.then {
                ResponseMapper<Character>.map($0)
            }.done { response in
                self.actionDispatcher.dispatch(CharacterDetailAction.CharacterLoaded(character: response))
            }.catch { error in
                print(error.localizedDescription)
                self.actionDispatcher.dispatch(CharacterDetailAction.LoadingCharacterFailed(error: error))
        }
    }
}
