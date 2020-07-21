//
//  AlertView.swift
//  FromHome
//
//  Created by Bia Plutarco on 20/07/20.
//  Copyright © 2020 biaplutarco. All rights reserved.
//

import UIKit

class AlertView: UIView {

    enum AlertType {
        case skip
        case input
        case warning
    }

    private var cardView = UIView(cardType: .alert)

    private var titleLabel = UILabel()
    private var bodyLabel = UILabel()

    private var rightButton = UIButton()
    private var leftButton = UIButton()

    private var textField = UITextField()

    private var horizontalLine = UIView(lineColor: .lineAlert)
    private var verticalLine = UIView(lineColor: .lineAlert)

    private lazy var textStackView: UIStackView = {
        let stackview = UIStackView(arrangedSubviews: [titleLabel, verticalLine])
        stackview.axis = .vertical

        return stackview
    }()

    private lazy var buttonStackView: UIStackView = {
        let stackview = UIStackView(arrangedSubviews: [leftButton])
        stackview.axis = .horizontal

        return stackview
    }()

    private lazy var stackView: UIStackView = {
        let stackview = UIStackView(arrangedSubviews: [textStackView, buttonStackView])
        stackview.axis = .vertical

        return stackview
    }()

    init(_ viewModel: AlertViewModel) {
        super.init(frame: .zero)

        setupView(for: viewModel.type)
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setupView(for type: AlertType) {

        switch type {

            case .input:
                textStackView.insertArrangedSubview(textField, at: 1)

                withRigthButton()

            case .skip:
                textStackView.insertArrangedSubview(bodyLabel, at: 1)

                withRigthButton()

            case .warning:
                textStackView.insertArrangedSubview(bodyLabel, at: 1)
        }

        addSubview(cardView)
        addSubview(stackView)

        applyStyle()
        constraints()
    }

    private func withRigthButton() {

        buttonStackView.addArrangedSubview(horizontalLine)
        buttonStackView.addArrangedSubview(rightButton)
    }

    private func applyStyle() {

        Style.fromHome.apply(textStyle: .titleAlert, to: titleLabel)
        Style.fromHome.apply(textStyle: .bodyCardFooter, to: bodyLabel)

        Style.fromHome.apply(textStyle: .titleButton, to: leftButton)
        Style.fromHome.apply(textStyle: .destructiveTitleButton, to: rightButton)
    }

    private func constraints() {

        cardView.fulfillSuperview()
        stackView.fulfillSuperview()
    }
}
