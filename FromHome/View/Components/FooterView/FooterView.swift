//
//  FooterView.swift
//  FromHome
//
//  Created by Bia Plutarco on 11/07/20.
//  Copyright © 2020 biaplutarco. All rights reserved.
//

import UIKit

class FooterView: UIView {

    private var cardView = UIView(cardType: .footer)
    private var titleView = CardTitleView(withTitle: "Title", for: .footer)
    private var bodyView = UIView()

    private lazy var stackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [titleView])
        stackView.alignment = .fill
        stackView.axis = .vertical
        stackView.spacing = 18

        return stackView
    }()

    private var type: FooterViewType

    init(viewModel: FooterViewModel) {

        self.type = viewModel.type

        super.init(frame: .zero)

        setupView()
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setupView() {

        clipsToBounds = false

        addSubview(cardView)
        addSubview(stackView)

        setupBodyView()
        constraints()
    }

    private func setupBodyView() {

        switch type {

            case .today:
                bodyView = TodayBodyView()

            default:
                break
        }

        stackView.addArrangedSubview(bodyView)
    }

    private func constraints() {

        bodyView.translatesAutoresizingMaskIntoConstraints = false
        stackView.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([

            stackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            stackView.topAnchor.constraint(equalTo: topAnchor, constant: 16),
            stackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            stackView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -18)
        ])

        cardView.fulfillSuperview()
    }
}
