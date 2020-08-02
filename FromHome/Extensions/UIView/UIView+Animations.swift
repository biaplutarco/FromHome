//
//  UIView+Animations.swift
//  FromHome
//
//  Created by Bia Plutarco on 11/07/20.
//  Copyright © 2020 biaplutarco. All rights reserved.
//

import UIKit

extension UIView {

    func scale(_ scale: CGFloat, withDurarion duration: TimeInterval, _ completion: (() -> Void)?) {

        UIView.animate(
            withDuration: duration,
            animations: {

                self.transform = CGAffineTransform(scaleX: scale, y: scale)
            },
            completion: { _ in

                UIView.animate(withDuration: duration, animations: {

                    self.transform = CGAffineTransform.identity
                },
                completion: { _ in

                    completion?()
                })
            })
    }
}
