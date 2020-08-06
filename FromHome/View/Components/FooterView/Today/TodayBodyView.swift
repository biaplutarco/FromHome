//
//  TodayBodyView.swift
//  FromHome
//
//  Created by Bia Plutarco on 11/07/20.
//  Copyright © 2020 biaplutarco. All rights reserved.
//

import UIKit

class TodayBodyView: UIView {

    private var bodyLabel = UILabel()

    lazy var button: UIButton = {
        let button = UIButton()
        button.layer.cornerRadius = 18

        return button
    }()

    private lazy var stackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [bodyLabel, button])
        stackView.alignment = .center
        stackView.axis = .vertical
        stackView.spacing = 24

        return stackView
    }()

    init(buttonTitle: String, bodyText: String) {

        super.init(frame: .zero)

        button.setTitle(buttonTitle, for: .normal)
        bodyLabel.text = bodyText

        setupView()
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setupView() {

        addSubview(stackView)

        constraints()
        applyStyle()
    }

    private func applyStyle() {

        bodyLabel.textAlignment = .center
        bodyLabel.lineBreakMode = .byWordWrapping
        bodyLabel.numberOfLines = 0

        Style.fromHome.apply(textStyle: .bodyCardFooter, to: bodyLabel)
        Style.fromHome.apply(textStyle: .titleButton, to: button)
    }

    private func constraints() {

        button.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            button.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.6),
            button.heightAnchor.constraint(equalToConstant: 36)
        ])

        stackView.fulfillSuperview()
    }

    private func completeWorkingHours(_ isWorkinHoursCompleted: Bool) {
        button.isHidden = isWorkinHoursCompleted
    }
}
