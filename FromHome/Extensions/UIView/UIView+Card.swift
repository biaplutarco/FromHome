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
                backgroundColor = .footerBackground

            case .header:
                layer.shadowColor = UIColor.shadowTop.cgColor
                backgroundColor = .headerBackground
        }

        layer.shadowOffset = CGSize(width: -1, height: 12)
        layer.shadowRadius = 8
        layer.shadowOpacity = 1

        layer.masksToBounds = false
        layer.cornerRadius = 8
        alpha = 0.5
    }
}
