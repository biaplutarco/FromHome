//
//  FooterView.swift
//  FromHome
//
//  Created by Bia Plutarco on 11/07/20.
//  Copyright © 2020 biaplutarco. All rights reserved.
//

import UIKit

class FooterView: UIView {

    private var titleView = CardTitleView(.footer)
    private var bodyView = UIView()

    private lazy var stackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [titleView])
        stackView.alignment = .fill
        stackView.axis = .vertical
        stackView.spacing = 18

        return stackView
    }()

    private var viewModel: FooterViewModel

    weak var delegate: FooterViewDelegate?

    init(viewModel: FooterViewModel) {

        self.viewModel = viewModel
        self.titleView.title(viewModel.title)

        super.init(frame: .zero)

        styleAsCard(.footer)

        setupView()
    }

    deinit {

        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillHideNotification, object: nil)
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setupView() {

        NotificationCenter.default.addObserver(
            self, selector: #selector(keyboardWillShow(notification:)),
            name: UIResponder.keyboardWillShowNotification, object: nil
        )

        NotificationCenter.default.addObserver(
            self, selector: #selector(keyboardWillHide(notification:)),
            name: UIResponder.keyboardWillHideNotification, object: nil
        )

        clipsToBounds = false

        addSubview(stackView)

        setupBodyView()
    }

    private func setupBodyView() {

        switch viewModel.type {

            case .today:
                guard let todayViewModel = viewModel as? TodayFooterViewModel else { return }

                bodyView = TodayBodyView(buttonTitle: todayViewModel.buttonTitle, bodyText: todayViewModel.bodyText)

            case .tasks:
                guard let tasksViewModel = viewModel as? TasksFooterViewModel else { return }

                let tasksBodyView = TasksBodyView(viewModel: tasksViewModel)
                tasksBodyView.delegate = self

                bodyView = tasksBodyView

            case .missionTime:
                guard let missionTimeViewModel = viewModel as? MissionTimeFooterViewModel else { return }

                bodyView = OptionsBodyView(viewModel: missionTimeViewModel)

            case .notification:
                guard let notificationViewModel = viewModel as? NotificationFooterViewModel else { return }

                bodyView = OptionsBodyView(viewModel: notificationViewModel)
        }

        stackView.addArrangedSubview(bodyView)
    }

    @objc
    func keyboardWillShow(notification: NSNotification) {

        guard let userInfo = notification.userInfo,
            let endValue = userInfo[UIResponder.keyboardFrameEndUserInfoKey] else { return }

        guard let durationValue = userInfo[UIResponder.keyboardAnimationDurationUserInfoKey] else { return }

        if let curveValue = userInfo[UIResponder.keyboardAnimationCurveUserInfoKey] {

            let endRect = convert((endValue as AnyObject).cgRectValue, from: stackView)
            let keyboardOverlap = frame.maxY - endRect.origin.y

            guard let superview = superview else { return }

            let offSet = superview.center.y - keyboardOverlap

            NSLayoutConstraint.activate([

                bottomAnchor.constraint(equalTo: superview.bottomAnchor, constant: -offSet)
            ])

            let duration = (durationValue as AnyObject).doubleValue
            let options = UIView.AnimationOptions(rawValue: UInt((curveValue as AnyObject).integerValue << 16))

            UIView.animate(withDuration: duration!, delay: 0, options: options, animations: {

                self.layoutIfNeeded()
            }, completion: nil)
        }
    }

    @objc
    func keyboardWillHide(notification: NSNotification) {

        guard let userInfo = notification.userInfo,
            let durationValue = userInfo[UIResponder.keyboardAnimationDurationUserInfoKey],
            let curveValue = userInfo[UIResponder.keyboardAnimationCurveUserInfoKey] else { return }

        guard let superview = superview else { return }

        NSLayoutConstraint.activate([

            bottomAnchor.constraint(equalTo: superview.bottomAnchor)
        ])

        let duration = (durationValue as AnyObject).doubleValue
        let options = UIView.AnimationOptions(rawValue: UInt((curveValue as AnyObject).integerValue << 16))

        UIView.animate(withDuration: duration!, delay: 0, options: options, animations: {

            self.layoutIfNeeded()
        }, completion: nil)
    }

    override func didMoveToSuperview() {

        guard let superview = superview else { fatalError("No super view") }

        translatesAutoresizingMaskIntoConstraints = false
        bodyView.translatesAutoresizingMaskIntoConstraints = false
        stackView.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([

            leadingAnchor.constraint(equalTo: superview.leadingAnchor, constant: 16),
            trailingAnchor.constraint(equalTo: superview.trailingAnchor, constant: -16),
            bottomAnchor.constraint(equalTo: superview.bottomAnchor, constant: 0),

            stackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            stackView.topAnchor.constraint(equalTo: topAnchor, constant: 16),
            stackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            stackView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -18)
        ])
    }
}
