//
//  UIView+Card.swift
//  FromHome
//
//  Created by Bia Plutarco on 09/07/20.
//  Copyright © 2020 biaplutarco. All rights reserved.
//

import UIKit

enum CardType {
    case footer
    case header
    case alert
}

extension UIView {

    func styleAsCard(_ cardType: CardType) {
        switch cardType {

            case .footer:

                addShadow(color: .shadowBottom)
                backgroundColor = .footerBackground
                alpha = 0.5

            case .header:

                addShadow(color: .shadowTop)
                backgroundColor = .headerBackground
                alpha = 0.5

            case .alert:
                layer.shadowColor = UIColor.shadowBottom.cgColor
                backgroundColor = .backgroundAlert
        }

        layer.masksToBounds = false
        layer.cornerRadius = 8
    }
}
