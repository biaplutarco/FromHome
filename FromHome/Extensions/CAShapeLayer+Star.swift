//
//  CAShapeLayer+Star.swift
//  FromHome
//
//  Created by Bia Plutarco on 09/07/20.
//  Copyright © 2020 biaplutarco. All rights reserved.
//

import UIKit

extension CAShapeLayer {

    convenience init(startPoint: CGPoint, size: CGFloat, color: UIColor) {

        self.init()

        let starPath = UIBezierPath()
        starPath.move(to: startPoint)
        starPath.addLine(to: CGPoint(x: startPoint.x + size, y: startPoint.y + size))
        starPath.move(to: CGPoint(x: startPoint.x + size, y: startPoint.y ))
        starPath.addLine(to: CGPoint(x: startPoint.x, y: startPoint.y + size))

        path = starPath.cgPath
        strokeColor = color.cgColor
    }
}
