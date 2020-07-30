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

    private var textField = FHTextField()

    private var horizontalLine = UIView(lineColor: .lineAlert)
    private var verticalLine = UIView(lineColor: .lineAlert)

    private var type: AlertViewModelType

    private lazy var textStackView = UIStackView(subviews: [titleLabel], alignment: .center, distribution: .fill, axis: .vertical, spacing: 18)
    private lazy var buttonStackView = UIStackView(subviews: [leftButton], alignment: .fill, distribution: .fill, axis: .horizontal, spacing: 0)

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

    deinit {

        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillHideNotification, object: nil)
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setupTexts(for viewModel: AlertViewModel) {

        titleLabel.text = viewModel.title
        bodyLabel.text = viewModel.bodyMessage

        leftButton.setTitle(viewModel.leftButtonTitle, for: .normal)
        rightButton.setTitle(viewModel.rightButtonTitle, for: .normal)
    }

    private func setupView() {

        NotificationCenter.default.addObserver(
            self, selector: #selector(keyboardWillShowOrHide(notification:)),
            name: UIResponder.keyboardWillShowNotification, object: nil
        )

        NotificationCenter.default.addObserver(
            self, selector: #selector(keyboardWillShowOrHide(notification:)),
            name: UIResponder.keyboardWillHideNotification, object: nil
        )

        textField.delegate = self

        setupStackViews()
        styleAsCard(.alert)
        applyStyle()
        subviewsConstraints()
        actions()
        initializeHideKeyboard()
    }

    private func setupStackViews() {

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

    private func initializeHideKeyboard() {
        addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard)))
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

    @objc
    func dismissKeyboard() {
        endEditing(true)
    }

    @objc
    func keyboardWillShowOrHide(notification: NSNotification) {

        guard let userInfo = notification.userInfo,
            let endValue = userInfo[UIResponder.keyboardFrameEndUserInfoKey] else { return }

        guard let durationValue = userInfo[UIResponder.keyboardAnimationDurationUserInfoKey] else { return }

        if let curveValue = userInfo[UIResponder.keyboardAnimationCurveUserInfoKey] {

            let endRect = convert((endValue as AnyObject).cgRectValue, from: window)
            let keyboardOverlap = frame.maxY - endRect.origin.y

            guard let superview = superview else { return }

            let offSet = superview.center.y - keyboardOverlap

            NSLayoutConstraint.activate([

                centerYAnchor.constraint(equalTo: superview.centerYAnchor, constant: -offSet)
            ])

            let duration = (durationValue as AnyObject).doubleValue
            let options = UIView.AnimationOptions(rawValue: UInt((curveValue as AnyObject).integerValue << 16))

            UIView.animate(withDuration: duration!, delay: 0, options: options, animations: {

                self.layoutIfNeeded()
            }, completion: nil)
        }
    }

    override func didMoveToSuperview() {

        translatesAutoresizingMaskIntoConstraints = false

        guard let superview = superview else { return }

        NSLayoutConstraint.activate([

            centerYAnchor.constraint(equalTo: superview.centerYAnchor),
            leadingAnchor.constraint(equalTo: superview.leadingAnchor, constant: 24),
            trailingAnchor.constraint(equalTo: superview.trailingAnchor, constant: -24)
        ])
    }

    private func subviewsConstraints() {

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
