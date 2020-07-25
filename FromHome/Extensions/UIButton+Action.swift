//
//  UIButton+Action.swift
//  FromHome
//
//  Created by Bia Plutarco on 22/07/20.
//  Copyright © 2020 biaplutarco. All rights reserved.
//

import UIKit

extension UIButton {

    convenience init(action: Selector) {

        self.init()

        addTarget(self, action: action, for: .touchUpInside)
    }
}
