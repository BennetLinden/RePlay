//
//  DependencyContainer.swift
//  ReToedoes
//
//  Created by Bennet van der Linden on 25/07/2018.
//  Copyright © 2018 Bennet. All rights reserved.
//

import Foundation
import UIKit
import ReSwift
import RxSwift

final class DependencyContainer: DependencyProvider {

    let reduxStore: Store<AppState> = Store<AppState>(reducer: appReducer, state: nil)
    let remoteAPI: RemoteAPI = RemoteAPI()

    func makeOnboardingDependencyContainer() -> OnboardingDependencyContainer {
        return OnboardingDependencyContainer(reduxStore: reduxStore)
    }

    func makeCharacterDependencyContainer() -> CharacterDependencyContainer {
        return CharacterDependencyContainer(reduxStore: reduxStore,
                                            remoteAPI: remoteAPI)
    }

    func makeEpisodeDependencyContainer() -> EpisodeDependencyContainer {
        return EpisodeDependencyContainer(reduxStore: reduxStore,
                                          remoteAPI: remoteAPI)
    }
}

extension DependencyContainer: StartUpViewControllerFactory, StartUpUseCaseFactory {

    func makeStartUpViewController() -> UIViewController {
        return StartUpViewController(presenter: makeStartUpPresenter(),
                                     onboardingViewControllerFactory: makeOnboardingDependencyContainer(),
                                     tabBarControllerFactory: self)
    }

    func makeStartUpPresenter() -> StartUpPresenter {
        return StartUpPresenter(stateObservable: makeStartUpStateObservable(),
                                useCaseFactory: self)
    }

    func makeStartUpStateObservable() -> Observable<StartUpState> {
        return reduxStore.makeObservable({ $0.startUpState })
    }

    func makeStartUpUseCase() -> UseCase {
        return StartUpUseCase(actionDispatcher: reduxStore)
    }
}

extension DependencyContainer: TabBarControllerFactory {

    func makeTabBarController() -> UIViewController {
        let tabBarController = UITabBarController()
        tabBarController.viewControllers = makeTabBarViewControllers()
        return tabBarController
    }

    func makeTabBarViewControllers() -> [UIViewController] {
        let characterListViewControllerFactory: CharacterListViewControllerFactory = makeCharacterDependencyContainer()
        let episodeListViewControllerFactory: EpisodeListViewControllerFactory = makeEpisodeDependencyContainer()
        return [
            characterListViewControllerFactory.makeCharacterListViewController(),
            episodeListViewControllerFactory.makeEpisodeListViewController()
        ]
    }
}
