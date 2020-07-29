//
//  AlertViewDelegate.swift
//  FromHome
//
//  Created by Bia Plutarco on 22/07/20.
//  Copyright © 2020 biaplutarco. All rights reserved.
//

import Foundation

protocol AlertViewDelegate: AnyObject {

    func action(withInput input: String?)
    func destructiveAction()
}
