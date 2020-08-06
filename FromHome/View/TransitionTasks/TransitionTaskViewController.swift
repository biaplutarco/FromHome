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

    let backButton = UIButton(cardWithImage: .back)
    let skipButton = UIButton(cardWithImage: .skip)

    let buttonStackView = UIStackView(subviews: [], alignment: .fill, distribution: .equalSpacing, axis: .horizontal, spacing: 0)

    weak var coordinator: MainCoordinator?

    init(backgroundView: UIView, taskType: TransitionTaskViewModel.TransitionType, coordinator: MainCoordinator) {
        super.init(nibName: nil, bundle: nil)

        view = backgroundView

        view.addSubviews([TasksView(viewModel: TransitionTaskViewModel(taskType).tasksViewModel), buttonStackView])

        self.coordinator = coordinator

        setupButtons()
        setupConstraints()
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    @objc
    func backToSetup() {
        coordinator?.returnToSetup()
    }

    @objc
    func skipToWork() {
        guard let universeView = view as? UniverseView else {
            fatalError("ja era")
        }

        let universeViewReplica = UniverseView.init(frame: universeView.frame, stars: universeView.stars)

        coordinator?.startDailyWork(universeViewReplica)
    }

    private func setupButtons() {

        buttonStackView.addArrangedSubview(backButton)
        buttonStackView.addArrangedSubview(skipButton)

        backButton.addTarget(self, action: #selector(backToSetup), for: .touchUpInside)
        skipButton.addTarget(self, action: #selector(skipToWork), for: .touchUpInside)
    }

    private func setupConstraints() {

        buttonStackView.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([

            buttonStackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 16),
            buttonStackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -16),
            buttonStackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -16),
            buttonStackView.heightAnchor.constraint(equalToConstant: 64),

            backButton.widthAnchor.constraint(equalToConstant: 64),
            skipButton.widthAnchor.constraint(equalTo: backButton.widthAnchor)
        ])
    }
}
