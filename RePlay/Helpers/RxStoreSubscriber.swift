//
//  RxStoreSubscriber.swift
//  ReToedoes
//
//  Created by Bennet van der Linden on 24/07/2018.
//  Copyright © 2018 Bennet. All rights reserved.
//

import Foundation
import ReSwift
import RxSwift

class RxStoreSubscriber<StateType>: StoreSubscriber {
    let rxObserver: AnyObserver<StateType>
    
    init(_ rxObserver: AnyObserver<StateType>) {
        self.rxObserver = rxObserver
    }
    
    func newState(state: StateType) {
        rxObserver.on(.next(state))
    }
}
