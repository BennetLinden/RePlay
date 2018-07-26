//
//  DependencyContainer.swift
//  ReToedoes
//
//  Created by Bennet van der Linden on 25/07/2018.
//  Copyright © 2018 Bennet. All rights reserved.
//

import UIKit
import ReSwift
import RxSwift

final class DependencyContainer: DependencyProvider {
    
    let reduxStore: Store<AppState> = Store<AppState>(reducer: appReducer, state: nil)
    let remoteAPI: RemoteAPI = RemoteAPI()
}
