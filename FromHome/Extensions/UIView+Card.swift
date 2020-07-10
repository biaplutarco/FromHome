//
//  UIView+Card.swift
//  FromHome
//
//  Created by Bia Plutarco on 09/07/20.
//  Copyright © 2020 biaplutarco. All rights reserved.
//

import UIKit

extension UIView {

    convenience init(cardType: CardType) {

        self.init()

        switch cardType {

            case .footer:
                layer.shadowColor = UIColor.shadowBottom.cgColor

            case .header:
                layer.shadowColor = UIColor.shadowTop.cgColor
        }

        layer.shadowOffset = CGSize(width: -1, height: 6)
        layer.shadowRadius = 12
        layer.shadowOpacity = 1

        layer.cornerRadius = 8
        layer.masksToBounds = false

        backgroundColor = .clear
    }
}
