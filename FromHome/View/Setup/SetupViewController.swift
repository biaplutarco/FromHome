//
//  SetupViewController.swift
//  FromHome
//
//  Created by Daniboy on 7/16/20.
//  Copyright © 2020 biaplutarco. All rights reserved.
//

import UIKit

class SetupViewController: UIViewController {
    override var preferredStatusBarStyle: UIStatusBarStyle {
        .lightContent
    }

    var coordinator: MainCoordinator?

    let greetingView = GreetingView()
    let planetView = UIImageView(image: .planet)

    lazy var todayView = SetupTodayView(self)
    lazy var timerView = SetupTimerView()
    lazy var tasksView = SetupTasksView(self)
    lazy var notificationView = SetupNotificationView()

    lazy var tabbedScrollView = TabbedScrollView.init(views: [
        self.todayView,
        self.timerView,
        self.tasksView
    ], images: [
        (unselected: .todayIcon, selected: .todayFillIcon),
        (unselected: .timerIcon, selected: .timerFillIcon),
        (unselected: .taskIcon, selected: .taskFillIcon)
    ])

    init(_ coordinator: MainCoordinator?) {
        self.coordinator = coordinator

        super.init(nibName: nil, bundle: nil)

        greetingView.delegate = self
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        view = UniverseView(frame: view.frame)

        view.addSubviews([greetingView, tabbedScrollView])

        setupConstraints()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        if let view = view as? UniverseView {
            view.makeSky()
        }
    }

    func setupConstraints() {

        planetView.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([

            //planetView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            //planetView.topAnchor.constraint(equalTo: greetingView.bottomAnchor, constant: 32),
            //planetView.heightAnchor.constraint(equalTo: planetView.widthAnchor, multiplier: 1),
            //planetView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 64),

            tabbedScrollView.topAnchor.constraint(equalTo: greetingView.bottomAnchor, constant: 16)
        ])
    }
}
