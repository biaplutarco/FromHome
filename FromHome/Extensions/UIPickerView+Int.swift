//
//  UIPickerView+Int.swift
//  FromHome
//
//  Created by Bia Plutarco on 02/08/20.
//  Copyright © 2020 biaplutarco. All rights reserved.
//

import UIKit

extension UIPickerView {

    convenience init(type: OptionType) {

        self.init(frame: .zero)

        tag = type.rawValue
    }
}
