//
//  OnboardingTipView.swift
//  FromHome
//
//  Created by Daniboy on 9/16/20.
//  Copyright © 2020 biaplutarco. All rights reserved.
//

import UIKit

class OnboardingTipView: UIView {

    let imageView: UIImageView

    let titleLabel: UILabel

    let bodyLabel: UILabel

    let stackView: UIStackView

    init(title: String, body: String, image: UIImage) {
        imageView = UIImageView.init(image: image)
        titleLabel = UILabel.init(text: title, textAlignment: .natural, lines: 0)
        bodyLabel = UILabel.init(text: body, textAlignment: .natural, lines: 0)

        stackView = UIStackView.init(subviews: [titleLabel, bodyLabel], alignment: .fill, distribution: .fillProportionally, axis: .vertical)

        super.init(frame: .zero)

        addSubviews([imageView, stackView])

        translatesAutoresizingMaskIntoConstraints = false

        applyStyle()
        setupConstraints()
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func applyStyle() {
        Style.fromHome.apply(textStyle: .onboardingSectionTitle, to: titleLabel)
        Style.fromHome.apply(textStyle: .onboardingSectionBody, to: bodyLabel)
    }

    func setupConstraints() {
        NSLayoutConstraint.activate([
            imageView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor),
            imageView.centerYAnchor.constraint(equalTo: safeAreaLayoutGuide.centerYAnchor),
            imageView.widthAnchor.constraint(equalToConstant: 32),
            imageView.heightAnchor.constraint(equalToConstant: 32),

            stackView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            stackView.leadingAnchor.constraint(equalTo: imageView.trailingAnchor, constant: 16),
            stackView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor),
            stackView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor)
        ])
    }
}
