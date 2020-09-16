//
//  OnboardingViewController.swift
//  FromHome
//
//  Created by Daniboy on 9/3/20.
//  Copyright © 2020 biaplutarco. All rights reserved.
//

import UIKit

class OnboardingViewController: UIViewController {

    lazy var universeView = UniverseView.init(frame: view.frame, stars: [])

    let titleLabel = UILabel.init(text: "Welcome\nto From Home", textAlignment: .natural, lines: 0)

    let section1 = OnboardingTipView.init(
        title: "Organize your routine",
        body: "Organize you routine defining your working hours and notify you when it’s time to work.",
        image: .notificationFillIcon
    )

    let section2 = OnboardingTipView.init(
        title: "Work better",
        body: "From Home helps you keep your productivity high avoiding burnout using the timer.",
        image: .timerFillIcon
    )

    let section3 = OnboardingTipView.init(
        title: "Go in a mission",
        body: "Your workday is a mission. So you need to be prepare to do it and preparation tasks.",
        image: .taskFillIcon
    )

    let continueButton = UIButton.init(title: "Continue")

    override func viewDidLoad() {
        super.viewDidLoad()

        self.titleLabel.alpha = 0
        self.continueButton.alpha = 0

        view.addSubviews([universeView, titleLabel, section1, section2, section3, continueButton])

        continueButton.addTarget(self, action: #selector(continueButtonPressed(_:)), for: .touchUpInside)

        isModalInPresentation = true

        applyStyle()
        setupConstraints()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        UIView.animate(withDuration: 1) {
            self.titleLabel.alpha = 1
            self.continueButton.alpha = 1
        }
    }

    func applyStyle() {
        Style.fromHome.apply(textStyle: .onboardingMainTitle, to: titleLabel)

        continueButton.styleAsCard(.footer)
    }

    func setupConstraints() {
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 32),
            titleLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 32),
            titleLabel.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -32),

            section1.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 48),
            section1.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 32),
            section1.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -32),

            section2.topAnchor.constraint(equalTo: section1.bottomAnchor, constant: 32),
            section2.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 32),
            section2.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -32),

            section3.topAnchor.constraint(equalTo: section2.bottomAnchor, constant: 32),
            section3.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 32),
            section3.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -32),

            continueButton.heightAnchor.constraint(equalToConstant: 49),
            continueButton.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 32),
            continueButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -32),
            continueButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -32)
        ])
    }

    @objc
    func continueButtonPressed(_ ssender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
}
