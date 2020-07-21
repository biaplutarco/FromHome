//
//  UIView+Card.swift
//  FromHome
//
//  Created by Bia Plutarco on 09/07/20.
//  Copyright © 2020 biaplutarco. All rights reserved.
//

import UIKit

extension UIView {

    func styleAsCard(_ cardType: CardType) {
        switch cardType {

            case .footer:

                addShadow(color: .shadowBottom)
                backgroundColor = .footerBackground

            case .header:

                addShadow(color: .shadowTop)
                backgroundColor = .headerBackground
        }

        layer.masksToBounds = false
        layer.cornerRadius = 8
    }
}
