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
}
