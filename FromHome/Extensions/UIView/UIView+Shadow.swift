//
//  UIView+Shadow.swift
//  FromHome
//
//  Created by Daniboy on 7/17/20.
//  Copyright © 2020 biaplutarco. All rights reserved.
//

import UIKit

extension UIView {
    func addShadow(color: UIColor) {
        layer.shadowColor = color.cgColor
        layer.shadowOffset = CGSize(width: -1, height: 12)
        layer.shadowRadius = 8
        layer.shadowOpacity = 1
    }
}
