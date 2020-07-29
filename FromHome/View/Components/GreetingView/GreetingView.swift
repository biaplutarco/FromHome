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
    private let viewModel = GreetingViewModel()

    private var greetingLabel = UILabel()
    private var usernameLabel = UILabel()

    private var astronautView = UIImageView(image: UIImage.init(named: "astronaut"))

    private lazy var stackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [greetingLabel, usernameLabel])
        stackView.alignment = .leading
        stackView.axis = .vertical

        return stackView
    }()

    init() {

        self.usernameLabel.text = viewModel.username
        self.greetingLabel.text = "Hello,"

        super.init(frame: .zero)

        styleAsCard(.header)
        setupView()
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func updateView() {
        usernameLabel.text = viewModel.username
    }

    private func setupView() {

        let tap = UITapGestureRecognizer(target: self, action: #selector(tapped))
        addGestureRecognizer(tap)

        clipsToBounds = false
        translatesAutoresizingMaskIntoConstraints = false

        addSubviews([stackView, astronautView])

        applyStyle()
    }

    @objc
    func tapped() {

        impact.impactOccurred()
        scale(0.9, withDurarion: 0.1)

        delegate?.didTapChangeUsername()
    }

    private func applyStyle() {

        Style.fromHome.apply(textStyle: .greeting, to: greetingLabel)
        Style.fromHome.apply(textStyle: .username, to: usernameLabel)
    }

    override func didMoveToSuperview() {
        super.didMoveToSuperview()

        guard let superview = superview else { fatalError("No super view") }

        NSLayoutConstraint.activate([

            stackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            stackView.topAnchor.constraint(equalTo: topAnchor, constant: 16),
            stackView.centerYAnchor.constraint(equalTo: centerYAnchor),

            astronautView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -8),
            astronautView.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.8),
            astronautView.widthAnchor.constraint(equalTo: heightAnchor, multiplier: 0.9),
            astronautView.bottomAnchor.constraint(equalTo: bottomAnchor),

            leadingAnchor.constraint(equalTo: superview.safeAreaLayoutGuide.leadingAnchor, constant: 16),
            trailingAnchor.constraint(equalTo: superview.safeAreaLayoutGuide.trailingAnchor, constant: -16),
            topAnchor.constraint(equalTo: superview.safeAreaLayoutGuide.topAnchor, constant: 16)
        ])
    }
}
