//
//  AlertViewModel.swift
//  FromHome
//
//  Created by Bia Plutarco on 21/07/20.
//  Copyright © 2020 biaplutarco. All rights reserved.
//

import Foundation

enum AlertViewModelType {
    case getOut
    case input
    case warning
}

protocol AlertViewModel {
    var type: AlertViewModelType { get }
    var title: String { get set }
    var leftButtonTitle: String { get set }
    var bodyMessage: String? { get set }
    var rightButtonTitle: String? { get }
}
