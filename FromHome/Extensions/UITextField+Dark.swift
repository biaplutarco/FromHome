//
//  UITextField+Dark.swift
//  FromHome
//
//  Created by Bia Plutarco on 22/07/20.
//  Copyright © 2020 biaplutarco. All rights reserved.
//

import UIKit

extension UITextField {

    convenience init(inputView: UIPickerView? = nil) {

        self.init()

        backgroundColor = .backgroundButton
        layer.cornerRadius = 8
    }
}
