//
//  UILabel.swift
//  FromHome
//
//  Created by Bia Plutarco on 22/07/20.
//  Copyright © 2020 biaplutarco. All rights reserved.
//

import UIKit

extension UILabel {

    convenience init(lines: Int) {

        self.init()

        lineBreakMode = .byWordWrapping
        numberOfLines = lines
        textAlignment = .center
    }

    convenience init(text: String, textAlignment: NSTextAlignment = .center) {
        self.init()

        translatesAutoresizingMaskIntoConstraints = false

        self.text = text
        self.textAlignment = textAlignment
    }
}
