//
//  GreetingHeader.swift
//  FromHome
//
//  Created by Bia Plutarco on 09/07/20.
//  Copyright © 2020 biaplutarco. All rights reserved.
//

import UIKit

class GreetingView: UIView {

    weak var delegate: GreetingViewDelegate?

    private let impact = UIImpactFeedbackGenerator()

    private var cardView = UIView(cardType: .header)

    private var greetingLabel = UILabel()
    private var usernameLabel = UILabel()

    private var astronautView = UIImageView(image: UIImage.init(named: "astronaut"))

    private lazy var stackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [greetingLabel, usernameLabel])
        stackView.alignment = .leading
        stackView.axis = .vertical

        return stackView
    }()

    init(viewModel: GreetingViewModel) {

        self.usernameLabel.text = viewModel.username
        self.greetingLabel.text = "Hello,"

        super.init(frame: .zero)

        setupView()
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setupView() {

        let tap = UITapGestureRecognizer(target: self, action: #selector(tapped))
        addGestureRecognizer(tap)

        clipsToBounds = false

        addSubview(cardView)
        addSubview(stackView)
        addSubview(astronautView)

        constraints()
        applyStyle()
    }

    @objc
    func tapped() {

        impact.impactOccurred()
        scale(0.9, withDurarion: 0.1)

        delegate?.didTapChangeUsername()
    }

    private func constraints() {

        stackView.translatesAutoresizingMaskIntoConstraints = false
        astronautView.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([

            stackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            stackView.topAnchor.constraint(equalTo: topAnchor, constant: 16),
            stackView.centerYAnchor.constraint(equalTo: centerYAnchor),

            astronautView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -8),
            astronautView.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.8),
            astronautView.widthAnchor.constraint(equalTo: heightAnchor, multiplier: 0.9),
            astronautView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])

        cardView.fulfillSuperview()
    }

    private func applyStyle() {

        Style.fromHome.apply(textStyle: .greeting, to: greetingLabel)
        Style.fromHome.apply(textStyle: .username, to: usernameLabel)
    }
}
