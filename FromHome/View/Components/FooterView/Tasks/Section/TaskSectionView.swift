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
        let stackView = UIStackView(arrangedSubviews: [titleLabel, buttonStackView])
        stackView.alignment = .fill
        stackView.axis = .vertical
        stackView.spacing = 18

        return stackView
    }()

    private lazy var buttonStackView: UIStackView = {
        let stackView = UIStackView(
            subviews: [firstButton, secondButton, thirdButton],
            alignment: .fill,
            distribution: .fill,
            axis: .vertical,
            spacing: 10)

        return stackView
    }()

    weak var delegate: TaskSectionViewDelegate?

    var type: TaskType

    init(sectionTitle: String, tasks: [String], type: TaskType) {

        self.titleLabel.text = sectionTitle
        self.type = type

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

        actions()
        constraints()
        applyStyle()
    }

    private func actions() {

        firstButton.addTarget(self, action: #selector(didTapButton(_:)), for: .touchUpInside)
        secondButton.addTarget(self, action: #selector(didTapButton(_:)), for: .touchUpInside)
        thirdButton.addTarget(self, action: #selector(didTapButton(_:)), for: .touchUpInside)
    }

    @objc
    func didTapButton(_ sender: UIButton) {
        let index: Int

        switch sender {
            case firstButton:
                index = 0

            case secondButton:
                index = 1

            case thirdButton:
                index = 2

            default:
                fatalError("unknown button index")
        }

        delegate?.presentChangeTaskAlert(taskSection: self, index: index)
    }

    func setButtonTitles(to tasks: [String]) {

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

            firstButton.heightAnchor.constraint(equalToConstant: 32),

            secondButton.heightAnchor.constraint(equalTo: firstButton.heightAnchor),

            thirdButton.heightAnchor.constraint(equalTo: firstButton.heightAnchor)
        ])

        stackView.fulfillSuperview()
    }
}
