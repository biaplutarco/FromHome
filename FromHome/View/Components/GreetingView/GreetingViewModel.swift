//
//  GreetingViewModel.swift
//  FromHome
//
//  Created by Bia Plutarco on 11/07/20.
//  Copyright © 2020 biaplutarco. All rights reserved.
//

import Foundation

class GreetingViewModel: NSObject {

    var username: String { UserDefaultsManager.userName() }
}
