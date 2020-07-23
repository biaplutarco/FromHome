//
//  StackView+Init.swift
//  FromHome
//
//  Created by Daniboy on 7/21/20.
//  Copyright © 2020 biaplutarco. All rights reserved.
//

import UIKit

extension UIStackView {
    convenience init(
        subviews: [UIView],
        alignment: Alignment = .center,
        distribution: Distribution = .fillEqually,
        axis: NSLayoutConstraint.Axis = .horizontal
    ) {

        self.init(arrangedSubviews: subviews)

        self.alignment = alignment
        self.distribution = distribution
        self.axis = axis
    }
}
