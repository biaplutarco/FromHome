//
//  TransitionTaskViewController.swift
//  FromHome
//
//  Created by Daniboy on 8/2/20.
//  Copyright © 2020 biaplutarco. All rights reserved.
//

import UIKit

class TransitionTaskViewController: UIViewController {
    override var preferredStatusBarStyle: UIStatusBarStyle {
        .lightContent
    }

    let contentView: TasksView

    let backButton = UIButton(cardWithImage: .back)
    let skipButton = UIButton(cardWithImage: .skip)

    let type: TransitionTaskViewModel.TransitionType

    weak var coordinator: MainCoordinator?

    init(stars: [CAShapeLayer], taskType: TransitionTaskViewModel.TransitionType, coordinator: MainCoordinator) {
        contentView = TasksView(viewModel: TransitionTaskViewModel(taskType).tasksViewModel)
        type = taskType

        super.init(nibName: nil, bundle: nil)

        view = UniverseView.init(frame: view.frame, stars: stars)

        if taskType == .getReady {
            view.addSubviews([contentView, backButton, skipButton])
        } else {
            view.addSubviews([contentView, skipButton])
        }

        backButton.addTarget(self, action: #selector(backButtonPressed(_:)), for: .touchUpInside)
        skipButton.addTarget(self, action: #selector(skipButtonPressed(_:)), for: .touchUpInside)

        self.coordinator = coordinator

        setupConstraints()
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        if let view = view as? UniverseView {
            view.makeSky()
        }
    }

    @objc
    func backButtonPressed(_ sender: UIButton) {
        coordinator?.returnToSetup()
    }

    @objc
    func skipButtonPressed(_ sender: UIButton) {

        if type == .goingHome {
            coordinator?.returnToSetup()
        } else {
            if let universeView = view as? UniverseView {
                coordinator?.startDailyWork(universeView.stars)
            }
        }
    }

    private func setupConstraints() {

        if type == .getReady {
            NSLayoutConstraint.activate([
                backButton.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 16),
                backButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -16),
                backButton.heightAnchor.constraint(equalToConstant: 64),
                backButton.widthAnchor.constraint(equalToConstant: 64)
            ])
        }

        NSLayoutConstraint.activate([
            skipButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -16),
            skipButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -16),
            skipButton.heightAnchor.constraint(equalToConstant: 64),
            skipButton.widthAnchor.constraint(equalToConstant: 64)
        ])
    }
}
