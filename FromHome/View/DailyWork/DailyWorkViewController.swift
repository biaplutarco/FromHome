//
//  DailyWorkViewController.swift
//  FromHome
//
//  Created by Daniboy on 8/4/20.
//  Copyright © 2020 biaplutarco. All rights reserved.
//

import UIKit

class DailyWorkViewController: UIViewController {
    override var preferredStatusBarStyle: UIStatusBarStyle {
        .lightContent
    }

    lazy var cardView = TitledCardView(titleType: .header, title: "Working", subView: self.cardContent, type: .header)

    lazy var cardContent = TimerClockView()

    lazy var clockManager = ClockManager.init(hours: 0, minutes: 3, delegate: self)

    weak var coordinator: MainCoordinator?

    let backButton = UIButton(cardWithImage: .back)
    let mealButton = UIButton(cardWithImage: .meal)
    let playPauseButton = UIButton(cardWithImage: .pause)

    init(backgroundView: UIView, coordinator: MainCoordinator) {
        super.init(nibName: nil, bundle: nil)

        view = backgroundView

        self.coordinator = coordinator

        view.addSubviews([cardView, backButton, mealButton, playPauseButton])

        backButton.addTarget(self, action: #selector(backButtonPressed(_:)), for: .touchUpInside)
        mealButton.addTarget(self, action: #selector(mealButtonPressed(_:)), for: .touchUpInside)
        playPauseButton.addTarget(self, action: #selector(playPauseButtonPressed(_:)), for: .touchUpInside)

        setupConstraints()
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        clockManager.startTimer()
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    @objc
    func backButtonPressed(_ sender: UIButton) {
        coordinator?.returnToSetup()
    }

    @objc
    func mealButtonPressed(_ sender: UIButton) {
        print("Todo - meal button")
    }

    @objc
    func playPauseButtonPressed(_ sender: UIButton) {
        print("Todo - play pause")
    }

    func setupConstraints() {

        NSLayoutConstraint.activate([
            cardView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 16),
            cardView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -16),
            cardView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 16),

            backButton.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 16),
            backButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -16),
            backButton.widthAnchor.constraint(equalToConstant: 64),
            backButton.heightAnchor.constraint(equalToConstant: 64),

            mealButton.trailingAnchor.constraint(equalTo: playPauseButton.leadingAnchor, constant: -16),
            mealButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -16),
            mealButton.widthAnchor.constraint(equalToConstant: 64),
            mealButton.heightAnchor.constraint(equalToConstant: 64),

            playPauseButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -16),
            playPauseButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -16),
            playPauseButton.widthAnchor.constraint(equalToConstant: 64),
            playPauseButton.heightAnchor.constraint(equalToConstant: 64)
        ])
    }
}
