//
//  TodayViewController.swift
//  FromHome
//
//  Created by Daniboy on 7/9/20.
//  Copyright © 2020 biaplutarco. All rights reserved.
//

import UIKit

class TodayViewController: UIViewController {

    var coordinator: TodayCoordinator?

    init() {
        super.init(nibName: nil, bundle: nil)
        tabBarItem = UITabBarItem(title: "Today", image: UIImage(), tag: 0)
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        let universeView = UniverseView(frame: view.frame)

        view.addSubview(universeView)

        universeView.fulfillSuperview()

        let greeting = GreetingView(viewModel: GreetingViewModel(username: "Dani"))
        let footer = FooterView(viewModel: TodayFooterViewModel())

        view.addSubview(greeting)
        view.addSubview(footer)

        greeting.translatesAutoresizingMaskIntoConstraints = false
        footer.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([

            greeting.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            greeting.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            greeting.topAnchor.constraint(equalTo: view.topAnchor, constant: 56),

            footer.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -108),
            footer.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            footer.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16)
        ])
    }
}
