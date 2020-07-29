//
//  AlertView.swift
//  FromHome
//
//  Created by Bia Plutarco on 20/07/20.
//  Copyright © 2020 biaplutarco. All rights reserved.
//

import UIKit

class AlertView: UIView {

    private var titleLabel = UILabel()
    private var bodyLabel = UILabel(lines: 0)

    private var rightButton = UIButton()
    private var leftButton = UIButton()

    private lazy var textField = FHTextField()

    private var horizontalLine = UIView(lineColor: .lineAlert)
    private var verticalLine = UIView(lineColor: .lineAlert)

    private var type: AlertViewModelType

    private lazy var textStackView: UIStackView = {
        let stackview = UIStackView(arrangedSubviews: [titleLabel])
        stackview.axis = .vertical
        stackview.spacing = 18
        stackview.distribution = .fill
        stackview.alignment = .center

        return stackview
    }()

    private lazy var buttonStackView: UIStackView = {
        let stackview = UIStackView(arrangedSubviews: [leftButton])
        stackview.axis = .horizontal
        stackview.alignment = .fill
        stackview.distribution = .fill

        return stackview
    }()

    private lazy var stackView: UIStackView = {
        let stackview = UIStackView(arrangedSubviews: [textStackView, buttonStackView])
        stackview.axis = .vertical

        return stackview
    }()

    weak var delegate: AlertViewDelegate?

    init(_ viewModel: AlertViewModel) {
        self.type = viewModel.type

        super.init(frame: .zero)

        setupView()
        setupTexts(for: viewModel)
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func actions() {

        rightButton.addTarget(self, action: #selector(rightAction), for: .touchUpInside)
        leftButton.addTarget(self, action: #selector(leftAction), for: .touchUpInside)
    }

    @objc
    func rightAction() {
        delegate?.destructiveAction()
    }

    @objc
    func leftAction() {

        switch type {

            case .input:
                delegate?.action(withInput: textField.text)

            default:
                delegate?.action(withInput: nil)
        }
    }

    private func setupTexts(for viewModel: AlertViewModel) {

        titleLabel.text = viewModel.title
        bodyLabel.text = viewModel.bodyMessage

        leftButton.setTitle(viewModel.leftButtonTitle, for: .normal)
        rightButton.setTitle(viewModel.rightButtonTitle, for: .normal)
    }

    private func setupView() {

        switch type {

            case .input:
                textStackView.addArrangedSubview(textField)
                textStackView.addArrangedSubview(horizontalLine)

                withRigthButton()
                textFieldConstraints()

            case .getOut:
                textStackView.addArrangedSubview(bodyLabel)
                textStackView.addArrangedSubview(horizontalLine)

                withRigthButton()
                bodyLabelConstraints()

            case .warning:
                textStackView.addArrangedSubview(bodyLabel)
                textStackView.addArrangedSubview(horizontalLine)

                bodyLabelConstraints()
        }

        addSubview(stackView)

        styleAsCard(.alert)
        applyStyle()
        constraints()
        actions() 
    }

    private func withRigthButton() {

        buttonStackView.addArrangedSubview(verticalLine)
        buttonStackView.addArrangedSubview(rightButton)

        rigtButtonConstraints()
    }

    private func applyStyle() {

        Style.fromHome.apply(textStyle: .titleAlert, to: titleLabel)
        Style.fromHome.apply(textStyle: .bodyCardFooter, to: bodyLabel)

        Style.fromHome.apply(textStyle: .alertTitleButton, to: leftButton)
        Style.fromHome.apply(textStyle: .destructiveTitleButton, to: rightButton)
    }

    private func constraints() {

        stackView.translatesAutoresizingMaskIntoConstraints = false
        horizontalLine.translatesAutoresizingMaskIntoConstraints = false
        leftButton.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([

            stackView.topAnchor.constraint(equalTo: topAnchor, constant: 24),
            stackView.leadingAnchor.constraint(equalTo: leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: trailingAnchor),
            stackView.bottomAnchor.constraint(equalTo: bottomAnchor),

            horizontalLine.heightAnchor.constraint(equalToConstant: 1),
            horizontalLine.widthAnchor.constraint(equalTo: stackView.widthAnchor),

            leftButton.heightAnchor.constraint(equalToConstant: 46)
        ])
    }

    private func textFieldConstraints() {

        textField.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([

            textField.leadingAnchor.constraint(equalTo: stackView.leadingAnchor, constant: 16),
            textField.trailingAnchor.constraint(equalTo: stackView.trailingAnchor, constant: -16),
            textField.heightAnchor.constraint(equalToConstant: 28)
        ])
    }

    private func rigtButtonConstraints() {

        verticalLine.translatesAutoresizingMaskIntoConstraints = false
        rightButton.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([

            verticalLine.widthAnchor.constraint(equalToConstant: 1),
            verticalLine.heightAnchor.constraint(equalTo: buttonStackView.heightAnchor),

            rightButton.widthAnchor.constraint(equalTo: leftButton.widthAnchor),
            rightButton.heightAnchor.constraint(equalTo: leftButton.heightAnchor)
        ])
    }

    private func bodyLabelConstraints() {

        bodyLabel.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([

            bodyLabel.leadingAnchor.constraint(equalTo: stackView.leadingAnchor, constant: 12),
            bodyLabel.trailingAnchor.constraint(equalTo: stackView.trailingAnchor, constant: -12)
        ])
    }
}
