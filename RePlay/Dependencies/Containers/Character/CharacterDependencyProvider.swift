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

    init(reduxStore: Store<AppState>)

    func makeCharacterListViewController() -> UIViewController
    func makeCharacterListPresenter() -> CharacterListPresenter
    func makeCharacterListStateObservable() -> Observable<CharacterListState>
    func makeLoadCharactersUseCase(params: [String: Any]?) -> UseCase

    func makeCharacterDetailViewController(for characterId: Int) -> UIViewController
    func makeCharacterDetailPresenter(for characterId: Int) -> CharacterDetailPresenter
    func makeCharacterDetailStateObservable() -> Observable<CharacterDetailViewState>
    func makeCharacterDetailsUseCase(characterId: Int) -> UseCase
}
