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

    init(backgroundView: UIView) {
        super.init(nibName: nil, bundle: nil)

        view = backgroundView

        view.addSubviews([cardView])

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

    func backToSetup() {
        dismiss(animated: true, completion: nil)
    }

    func setupConstraints() {

        NSLayoutConstraint.activate([
            cardView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 16),
            cardView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -16),
            cardView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 16)
        ])
    }
}
