//
//  LoginDependencyProvider.swift
//  RePlay
//
//  Created by Bennet van der Linden on 30/07/2018.
//  Copyright © 2018 Bennet. All rights reserved.
//

import Foundation
import UIKit
import ReSwift
import RxSwift

protocol LoginDependencyProvider {

    var reduxStore: Store<AppState> { get }

    init(reduxStore: Store<AppState>)

    func makeLoginViewController() -> UIViewController
    func makeLoginPresenter() -> LoginPresenter
    func makeLoginStateObservable() -> Observable<LoginState>
    func makeLoginUseCase(email: String, password: String) -> UseCase
}
