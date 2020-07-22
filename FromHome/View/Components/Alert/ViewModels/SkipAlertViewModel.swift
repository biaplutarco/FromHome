//
//  SkipAlertViewModel.swift
//  FromHome
//
//  Created by Bia Plutarco on 21/07/20.
//  Copyright © 2020 biaplutarco. All rights reserved.
//

import Foundation

enum SkipAlertMessage: String {

    case getReady =  "Are you sure you want to skip this? It will help your to prepare you mind to start to work"
    case goingHome =  "Are you sure you want to skip this? It will help your mind to understand that you at 'home' now"
}

class SkipAlertViewModel: AlertViewModel {

    var type: AlertViewModelType { .getOut }

    var title: String = "Skip" 

    var rightButtonTitle: String = "Skip" 

    var bodyMessage: String?

    var leftButtonTitle: String? { "Cancel" }

    init(_ message: SkipAlertMessage) {
        self.bodyMessage = message.rawValue
    }
}
