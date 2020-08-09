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

    lazy var cardView = TitledCardView(titleType: .header, title: "Work Time", subView: self.cardContent, type: .header)

    lazy var cardContent = TimerClockView()

    let clockManager: ClockManager

    var stars: [CAShapeLayer]?

    weak var coordinator: MainCoordinator?

    let backButton = UIButton(cardWithImage: .back)
//    let mealButton = UIButton(cardWithImage: .meal)
    let playPauseButton = UIButton(cardWithImage: .pause)

    init(stars: [CAShapeLayer], coordinator: MainCoordinator) {
        clockManager = ClockManager.init(workHours: UserDefaultsManager.workingHours(), coffeeBreakMinutes: UserDefaultsManager.coffeeBreakMinutes())
        super.init(nibName: nil, bundle: nil)

        clockManager.delegate = self

        view = UniverseView.init(frame: view.frame, stars: stars)

        self.coordinator = coordinator

        view.addSubviews([
            cardView,
            backButton,
            //mealButton,
            playPauseButton
        ])

        backButton.addTarget(self, action: #selector(backButtonPressed(_:)), for: .touchUpInside)
        //mealButton.addTarget(self, action: #selector(mealButtonPressed(_:)), for: .touchUpInside)
        playPauseButton.addTarget(self, action: #selector(playPauseButtonPressed(_:)), for: .touchUpInside)

        setupConstraints()
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        clockManager.startTimer()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        if let view = view as? UniverseView {
            view.makeSky()
        }
    }

    @objc
    func backButtonPressed(_ sender: UIButton) {
        clockManager.stopTimer()
        coordinator?.returnToSetup()
    }

//    @objc
//    func mealButtonPressed(_ sender: UIButton) {
//        print("Todo - meal button")
//    }

    @objc
    func playPauseButtonPressed(_ sender: UIButton) {
        if clockManager.isPaused() {
            clockManager.startTimer()
            playPauseButton.setImage(.pause, for: .normal)
        } else {
            clockManager.stopTimer()
            playPauseButton.setImage(.play, for: .normal)
        }
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

            //mealButton.trailingAnchor.constraint(equalTo: playPauseButton.leadingAnchor, constant: -16),
            //mealButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -16),
            //mealButton.widthAnchor.constraint(equalToConstant: 64),
            //mealButton.heightAnchor.constraint(equalToConstant: 64),

            playPauseButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -16),
            playPauseButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -16),
            playPauseButton.widthAnchor.constraint(equalToConstant: 64),
            playPauseButton.heightAnchor.constraint(equalToConstant: 64)
        ])
    }
}
