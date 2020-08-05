//
//  UIButton+CardButton.swift
//  FromHome
//
//  Created by Bia Plutarco on 02/08/20.
//  Copyright © 2020 biaplutarco. All rights reserved.
//

import UIKit

extension UIButton {

    convenience init(cardWithImage image: UIImage) {

        self.init(frame: .zero)

        addShadow(color: .shadowBottom)
        setImage(image, for: .normal)
        backgroundColor = .footerBackground

        layer.masksToBounds = false
        layer.cornerRadius = 14
    }
}
