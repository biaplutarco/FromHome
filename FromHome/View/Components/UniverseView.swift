//
//  UniverseView.swift
//  FromHome
//
//  Created by Bia Plutarco on 09/07/20.
//  Copyright © 2020 biaplutarco. All rights reserved.
//

import UIKit

class UniverseView: UIView {

    var stars = [CAShapeLayer]()

    private lazy var gradientLayer: CAGradientLayer = {
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = [UIColor.gradientTop.cgColor, UIColor.gradientBottom.cgColor]
        gradientLayer.frame = frame

        return gradientLayer
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)

        stars = randomStars(quant: 20)

        makeSky()
    }

    init(frame: CGRect, stars: [CAShapeLayer]) {
        super.init(frame: frame)

        self.stars = stars

        makeSky()
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

    private func randomStars(quant: Int) -> [CAShapeLayer] {

        var starList = [CAShapeLayer]()

        for _ in 0...quant {
            let star = CAShapeLayer(startPoint: randomPoint(), size: randomSize(), color: .secondaryText)
            starList.append(star)
        }

        return starList
    }

    func addStars() -> CALayer {

        let startsLayer = CALayer()
        startsLayer.frame = frame

        for star in stars {
            startsLayer.addSublayer(star)
        }

        return startsLayer
    }

    func makeSky() {
        let starsLayer = addStars()

        layer.insertSublayer(starsLayer, at: 0)
        layer.insertSublayer(gradientLayer, at: 0)
    }
}
