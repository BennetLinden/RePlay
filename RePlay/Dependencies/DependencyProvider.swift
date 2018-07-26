//
//  DependencyProvider.swift
//  ReToedoes
//
//  Created by Bennet van der Linden on 25/07/2018.
//  Copyright © 2018 Bennet. All rights reserved.
//

import UIKit
import RxSwift
import ReSwift

protocol DependencyProvider {

    var reduxStore: Store<AppState> { get }
    var remoteAPI: RemoteAPI { get }
}
