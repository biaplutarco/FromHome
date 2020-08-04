//
//  TitledCardView.swift
//  FromHome
//
//  Created by Daniboy on 7/31/20.
//  Copyright © 2020 biaplutarco. All rights reserved.
//

import UIKit

class TitledCardView: UIView {

    private let titleView: CardTitleView

    private let stackView: UIStackView

    init(titleType: CardTitleType, title: String, subView: UIView, type: CardType) {

        titleView = CardTitleView.init(titleType)

        stackView = UIStackView.init(
            subviews: [titleView, subView],
            alignment: .fill,
            distribution: .fill,
            axis: .vertical,
            spacing: 18
        )

        titleView.changeTitle(title)

        super.init(frame: .zero)

        translatesAutoresizingMaskIntoConstraints = false

        styleAsCard(type)

        setupView()
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setupView() {

        clipsToBounds = false

        addSubviews([stackView])
    }

    override func didMoveToSuperview() {

        guard let superview = superview else { fatalError("No super view") }

        translatesAutoresizingMaskIntoConstraints = false
        stackView.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([

            leadingAnchor.constraint(equalTo: superview.leadingAnchor, constant: 16),
            trailingAnchor.constraint(equalTo: superview.trailingAnchor, constant: -16),
            bottomAnchor.constraint(equalTo: superview.bottomAnchor, constant: 0),

            stackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            stackView.topAnchor.constraint(equalTo: topAnchor, constant: 16),
            stackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            stackView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -18)
        ])
    }
}
