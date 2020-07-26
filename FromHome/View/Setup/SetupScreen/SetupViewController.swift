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

    let tabbedScrollView: TabbedScrollView

    init(_ coordinator: MainCoordinator?) {
        self.coordinator = coordinator

        let view1 = UIView()
        let view2 = UIView()
        let view3 = UIView()
        let view4 = UIView()

        view2.backgroundColor = .green
        view4.backgroundColor = .yellow

        let todayView = FooterView(viewModel: TodayFooterViewModel())
        let tasksView = FooterView(viewModel: TasksFooterViewModel())

        view1.addSubview(todayView)
        view3.addSubview(tasksView)

        tabbedScrollView = TabbedScrollView.init(views: [view1, view2, view3, view4], images: [
            (unselected: .todayIcon, selected: .todayFillIcon),
            (unselected: .timerIcon, selected: .timerFillIcon),
            (unselected: .taskIcon, selected: .taskFillIcon),
            (unselected: .notificationIcon, selected: .notificationFillIcon)
        ])

        super.init(nibName: nil, bundle: nil)

        greetingView.delegate = self
        tasksView.delegate = self
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
