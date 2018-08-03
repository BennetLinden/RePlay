//
//  EpisodeDependencyProvider.swift
//  RePlay
//
//  Created by Bennet van der Linden on 02/08/2018.
//  Copyright (c) 2018 Bennet. All rights reserved.
//
//

import Foundation
import UIKit
import ReSwift
import RxSwift

protocol EpisodeDependencyProvider {

    var reduxStore: Store<AppState> { get }
    var remoteAPI: RemoteAPI { get }

    init(reduxStore: Store<AppState>,
         remoteAPI: RemoteAPI)

    func makeEpisodeListViewController() -> UIViewController
    func makeEpisodeListPresenter() -> EpisodeListPresenter
    func makeEpisodeListStateObservable() -> Observable<EpisodeListState>
    func makeLoadEpisodeListUseCase(params: [String: Any]?) -> UseCase
}
