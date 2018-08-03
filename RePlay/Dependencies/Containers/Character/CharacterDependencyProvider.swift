//
//  CharacterDependencyProvider.swift
//  RePlay
//
//  Created by Bennet van der Linden on 31/07/2018.
//  Copyright © 2018 Bennet. All rights reserved.
//

import Foundation
import UIKit
import ReSwift
import RxSwift

protocol CharacterDependencyProvider {

    var reduxStore: Store<AppState> { get }
    var remoteAPI: RemoteAPI { get }

    init(reduxStore: Store<AppState>,
         remoteAPI: RemoteAPI)

    func makeCharacterListViewController() -> UIViewController
    func makeCharacterListPresenter() -> CharacterListPresenter
    func makeCharacterListStateObservable() -> Observable<CharacterListState>
    func makeLoadCharacterListUseCase(params: [String: Any]?) -> UseCase

    func makeCharacterDetailViewController(for characterId: Int) -> UIViewController
    func makeCharacterDetailPresenter(for characterId: Int) -> CharacterDetailPresenter
    func makeCharacterDetailStateObservable() -> Observable<CharacterDetailViewState>
    func makeLoadCharacterDetailsUseCase(characterId: Int) -> UseCase
}
