//
//  Store+Extensions.swift
//  ReToedoes
//
//  Created by Bennet van der Linden on 24/07/2018.
//  Copyright © 2018 Bennet. All rights reserved.
//

import Foundation
import RxSwift
import ReSwift

extension Store {

    public func makeObservable<SelectedState>(_ selector: @escaping ((State) -> SelectedState)) -> Observable<SelectedState> {
        return Observable.create(self.makeSubscribeClosure(selector))
    }

    public func makeObservable<SelectedState>(_ selector: @escaping ((State) -> SelectedState)) -> Observable<SelectedState> where SelectedState: Equatable {
        return Observable.create(self.makeSubscribeClosure(selector)).distinctUntilChanged()
    }

    private func makeSubscribeClosure<SelectedState>(_ selector: @escaping ((State) -> SelectedState)) -> ((AnyObserver<SelectedState>) -> Disposable) {
        return { [weak self] observer in
            guard let strongSelf = self else { return Disposables.create() }
            return strongSelf.subscribe(observer, selector: selector)
        }
    }

    private func subscribe<SelectedState>(_ rxObserver: AnyObserver<SelectedState>,
                                          selector: @escaping ((State) -> SelectedState)) -> RxSwift.Cancelable {
        let subscriber = RxStoreSubscriber<SelectedState>(rxObserver)
        self.subscribe(subscriber) { subscription in
            subscription.select(selector)
        }
        return makeDisposable(subscriber)
    }

    private func makeDisposable(_ subscriber: AnyStoreSubscriber) -> RxSwift.Cancelable {
        return Disposables.create { [weak self] in
            self?.unsubscribe(subscriber)
        }
    }
}
