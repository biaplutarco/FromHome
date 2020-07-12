//
//  CardTitleView.swift
//  FromHome
//
//  Created by Bia Plutarco on 07/07/20.
//  Copyright © 2020 biaplutarco. All rights reserved.
//

import UIKit

enum CardType {
    case footer
    case header
}

class CardTitleView: UIView {

    private var titleLabel = UILabel()
    private var line = UIView()

    private lazy var stackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [titleLabel, line])
        stackView.alignment = .center
        stackView.axis = .vertical
        stackView.spacing = 12

        return stackView
    }()

    var type: CardType

    init(_ type: CardType) {

        self.type = type

        super.init(frame: .zero)

        setupView()
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func title(_ title: String) {
        titleLabel.text = title
    }

    private func setupView() {

        addSubview(stackView)

        constraints()
        applyStyle()
    }

    private func applyStyle() {

        switch type {

            case .header:
                line.backgroundColor = .lineTop

                Style.fromHome.apply(textStyle: .titleCardHeader, to: titleLabel)

            case .footer:
                line.backgroundColor = .lineBottom

                Style.fromHome.apply(textStyle: .titleCardFooter, to: titleLabel)
        }
    }

    private func constraints() {

        line.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([

            line.heightAnchor.constraint(equalToConstant: 1),
            line.widthAnchor.constraint(equalTo: stackView.widthAnchor, multiplier: 0.8)
        ])

        stackView.fulfillSuperview()
    }
}
