//
//  UniverseView.swift
//  FromHome
//
//  Created by Bia Plutarco on 09/07/20.
//  Copyright © 2020 biaplutarco. All rights reserved.
//

import UIKit

class UniverseView: UIView {

    private lazy var gradientLayer: CAGradientLayer = {
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = [UIColor.gradientTop.cgColor, UIColor.gradientBottom.cgColor]
        gradientLayer.frame = frame

        return gradientLayer
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)

        layer.addSublayer(gradientLayer)
        layer.addSublayer(starts(quant: 20))
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func randomPoint() -> CGPoint {
        CGPoint(x: CGFloat.random(in: 0...frame.maxX), y: CGFloat.random(in: 0...frame.maxY))
    }

    private func randomSize() -> CGFloat {
        CGFloat.random(in: 1...5)
    }

    private func starts(quant: Int) -> CALayer {

        let startsLayer = CALayer()
        startsLayer.frame = frame

        for _ in 0...quant {

            let star = CAShapeLayer(startPoint: randomPoint(), size: randomSize(), color: .secondaryText)

            startsLayer.addSublayer(star)
        }

        return startsLayer
    }
}
