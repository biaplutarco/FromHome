//
//  Observable.swift
//  FromHome
//
//  Created by Bia Plutarco on 14/07/20.
//  Copyright © 2020 biaplutarco. All rights reserved.
//

import Foundation

protocol ObserverProtocol {

    var identifier: Int { get set }

    func onValueChanged(_ value: Any?)
}

class Observable<T> {

    typealias CompletionHandler = ((T) -> Void)

    var observers: [Int: CompletionHandler] = [:]

    var value: T {
        didSet {
            notifyObservers(observers)
        }
    }

    init(value: T) {
        self.value = value
    }

    func addObserver(_ observer: ObserverProtocol, completion: @escaping CompletionHandler) {
        observers[observer.identifier] = completion
    }

    func removeObserver(_ observer: ObserverProtocol) {
        observers.removeValue(forKey: observer.identifier)
    }

    func notifyObservers(_ observers: [Int: CompletionHandler]) {
        observers.forEach({ $0.value(value) })
    }

    deinit {
        observers.removeAll()
    }
}
