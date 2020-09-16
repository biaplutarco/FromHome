//
//  UIButton+Init.swift
//  FromHome
//
//  Created by Daniboy on 7/21/20.
//  Copyright © 2020 biaplutarco. All rights reserved.
//

import UIKit

extension UIButton {
    convenience init(image: UIImage) {
        self.init(frame: .zero)

        translatesAutoresizingMaskIntoConstraints = false

        setImage(image, for: .normal)
    }

    convenience init(title: String) {
        self.init(frame: .zero)

        translatesAutoresizingMaskIntoConstraints = false

        backgroundColor = UIColor.backgroundTextfield
        layer.cornerRadius = 16
        setTitle(title, for: .normal)
        Style.fromHome.apply(textStyle: .titleButton, to: self)
        applyCornerRadius()
    }
}
