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

    let greetingView = GreetingView(viewModel: GreetingViewModel(username: "Dani"))

    lazy var todayView = SetupTodayView(self)
    lazy var timerView = SetupTimerView()
    lazy var tasksView = SetupTasksView()
    lazy var notificationView = SetupNotificationView()

    lazy var tabbedScrollView = TabbedScrollView.init(views: [
        self.todayView,
        self.timerView,
        self.tasksView,
        self.notificationView
    ], images: [
        (unselected: .todayIcon, selected: .todayFillIcon),
        (unselected: .timerIcon, selected: .timerFillIcon),
        (unselected: .taskIcon, selected: .taskFillIcon),
        (unselected: .notificationIcon, selected: .notificationFillIcon)
    ])

    init(_ coordinator: MainCoordinator?) {
        self.coordinator = coordinator

        super.init(nibName: nil, bundle: nil)

        greetingView.delegate = self
//        tasksView.delegate = self
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

    func setupConstraints() {
        NSLayoutConstraint.activate([
            tabbedScrollView.topAnchor.constraint(equalTo: greetingView.bottomAnchor, constant: 16)
        ])
    }
}
