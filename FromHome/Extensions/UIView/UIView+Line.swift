//
//  UIView+Line.swift
//  FromHome
//
//  Created by Bia Plutarco on 20/07/20.
//  Copyright © 2020 biaplutarco. All rights reserved.
//

import UIKit

extension UIView {

    convenience init(lineColor: UIColor) {

        self.init()

        frame = CGRect(x: 0, y: 0, width: 1, height: 0)
        backgroundColor = lineColor
    }
}
