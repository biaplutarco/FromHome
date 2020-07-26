//
//  TaskSectionView.swift
//  FromHome
//
//  Created by Bia Plutarco on 25/07/20.
//  Copyright © 2020 biaplutarco. All rights reserved.
//

import UIKit

class TaskSectionView: UIView {

    private var titleLabel = UILabel()

    private var firstButton = UIButton()
    private var secondButton = UIButton()
    private var thirdButton = UIButton()

    private lazy var stackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [titleLabel, firstButton, secondButton, thirdButton])
        stackView.alignment = .fill
        stackView.axis = .vertical
        stackView.spacing = 18

        return stackView
    }()

    init(sectionTitle: String, tasks: [String]) {

        self.titleLabel.text = sectionTitle

        super.init(frame: .zero)

        setupView()
        setButtonTitles(to: tasks)
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

    private func setButtonTitles(to tasks: [String]) {

        firstButton.setTitle(tasks[0], for: .normal)
        secondButton.setTitle(tasks[1], for: .normal)
        thirdButton.setTitle(tasks[2], for: .normal)
    }

    private func applyStyle() {

        firstButton.applyCornerRadius()
        secondButton.applyCornerRadius()
        thirdButton.applyCornerRadius()

        Style.fromHome.apply(textStyle: .subtitleCardFooter, to: titleLabel)

        Style.fromHome.apply(textStyle: .titleButton, to: firstButton)
        Style.fromHome.apply(textStyle: .titleButton, to: secondButton)
        Style.fromHome.apply(textStyle: .titleButton, to: thirdButton)
    }

    private func constraints() {

        firstButton.translatesAutoresizingMaskIntoConstraints = false
        secondButton.translatesAutoresizingMaskIntoConstraints = false
        thirdButton.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([

            firstButton.heightAnchor.constraint(equalToConstant: 36),

            secondButton.heightAnchor.constraint(equalTo: firstButton.heightAnchor),

            thirdButton.heightAnchor.constraint(equalTo: firstButton.heightAnchor)
        ])

        stackView.fulfillSuperview()
    }
}
