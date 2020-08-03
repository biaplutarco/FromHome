////
////  FooterView.swift
////  FromHome
////
////  Created by Bia Plutarco on 11/07/20.
////  Copyright © 2020 biaplutarco. All rights reserved.
////
//
//import UIKit
//
//class FooterView: UIView {
//
//    private var titleView = CardTitleView(.footer)
//    private var bodyView = UIView()
//
//    private lazy var stackView: UIStackView = {
//        let stackView = UIStackView(arrangedSubviews: [titleView])
//        stackView.alignment = .fill
//        stackView.axis = .vertical
//        stackView.spacing = 18
//
//        return stackView
//    }()
//
//    private var viewModel: FooterViewModel
//
//    weak var delegate: FooterViewDelegate?
//
//    init(viewModel: FooterViewModel) {
//
//        self.viewModel = viewModel
//        self.titleView.changeTitle(viewModel.title)
//
//        super.init(frame: .zero)
//
//        styleAsCard(.footer)
//
//        setupView()
//    }
//
//    @available(*, unavailable)
//    required init?(coder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
//
//    private func setupView() {
//
//        clipsToBounds = false
//
//        addSubview(stackView)
//
//        setupBodyView()
//    }
//
//    private func setupBodyView() {
//
//        switch viewModel.type {
//
//            case .today:
//                guard let todayViewModel = viewModel as? TodayFooterViewModel else { return }
//
//                bodyView = TodayBodyView(buttonTitle: todayViewModel.buttonTitle, bodyText: todayViewModel.bodyText)
//
//            case .tasks:
//                guard let tasksViewModel = viewModel as? TasksFooterViewModel else { return }
//
//                let tasksBodyView = TasksBodyView(getReady: tasksViewModel.getReady, goHome: tasksViewModel.goHome)
//                tasksBodyView.delegate = self
//
//                bodyView = tasksBodyView
//
//            case .missionTime:
//                guard let missionTimeViewModel = viewModel as? MissionTimeFooterViewModel else { return }
//
//                bodyView = OptionsBodyView(options: missionTimeViewModel.options)
//
//            case .notification:
//                guard let notificationViewModel = viewModel as? NotificationFooterViewModel else { return }
//
//                bodyView = OptionsBodyView(options: notificationViewModel.options)
//        }
//
//        stackView.addArrangedSubview(bodyView)
//    }
//
//    override func didMoveToSuperview() {
//
//        guard let superview = superview else { fatalError("No super view") }
//
//        translatesAutoresizingMaskIntoConstraints = false
//        bodyView.translatesAutoresizingMaskIntoConstraints = false
//        stackView.translatesAutoresizingMaskIntoConstraints = false
//
//        NSLayoutConstraint.activate([
//
//            leadingAnchor.constraint(equalTo: superview.leadingAnchor, constant: 16),
//            trailingAnchor.constraint(equalTo: superview.trailingAnchor, constant: -16),
//            bottomAnchor.constraint(equalTo: superview.bottomAnchor, constant: 0),
//
//            stackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
//            stackView.topAnchor.constraint(equalTo: topAnchor, constant: 16),
//            stackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
//            stackView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -18)
//        ])
//    }
//}
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
    private var bottomConstraint: NSLayoutConstraint?
    private var isKeyboardUp: Bool = false

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
            self, selector: #selector(keyboardWillHide),
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

        let endRect = convert((endValue as AnyObject).cgRectValue, from: stackView)
        let keyboardOverlap = frame.maxY - endRect.origin.y
        let offSet = stackView.frame.maxY - keyboardOverlap

        if !isKeyboardUp {

            bottomConstraint?.isActive = false
            bottomConstraint?.constant = -offSet
            bottomConstraint?.isActive = true
        }

        UIView.animate(withDuration: 0.5) {
            self.layoutIfNeeded()
            self.isKeyboardUp = true
        }
    }

    @objc
    func keyboardWillHide() {

        if isKeyboardUp {

            bottomConstraint?.isActive = false
            bottomConstraint?.constant = 0
            bottomConstraint?.isActive = true
        }

        UIView.animate(withDuration: 0.5) {
            self.layoutIfNeeded()
            self.isKeyboardUp = false
        }
    }

    override func didMoveToSuperview() {

        guard let superview = superview else { fatalError("No super view") }

        translatesAutoresizingMaskIntoConstraints = false
        bodyView.translatesAutoresizingMaskIntoConstraints = false
        stackView.translatesAutoresizingMaskIntoConstraints = false

        self.bottomConstraint = bottomAnchor.constraint(equalTo: superview.bottomAnchor, constant: 0)

        guard let bottomConstraint = self.bottomConstraint else { return }

        NSLayoutConstraint.activate([

            bottomConstraint,

            leadingAnchor.constraint(equalTo: superview.leadingAnchor, constant: 16),
            trailingAnchor.constraint(equalTo: superview.trailingAnchor, constant: -16),

            stackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            stackView.topAnchor.constraint(equalTo: topAnchor, constant: 16),
            stackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            stackView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -18)
        ])
    }
}
