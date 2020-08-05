//
//  TransitionTaskViewController.swift
//  FromHome
//
//  Created by Daniboy on 8/2/20.
//  Copyright © 2020 biaplutarco. All rights reserved.
//

import UIKit

class TransitionTaskViewController: UIViewController {

    let backButton = UIButton(cardWithImage: .back)
    let skipButton = UIButton(cardWithImage: .skip)

    let buttonStackView = UIStackView(subviews: [], alignment: .fill, distribution: .equalSpacing, axis: .horizontal, spacing: 0)

    override var preferredStatusBarStyle: UIStatusBarStyle {
        .lightContent
    }

    convenience init(backgroundView: UIView, viewModel: TransitionTaskViewModel) {
        self.init(nibName: nil, bundle: nil)

        view = backgroundView

        view.addSubviews([TasksView(viewModel: viewModel.tasksViewModel), buttonStackView])

        setupButtons()
        setupConstraints()
    }

    @objc
    func backToSetup() {
        dismiss(animated: true, completion: nil)
    }

    @objc
    func skipToWork() {
        // TODO: Abrir work timer controller
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
