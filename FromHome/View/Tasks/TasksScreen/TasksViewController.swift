//
//  TasksViewController.swift
//  FromHome
//
//  Created by Daniboy on 7/9/20.
//  Copyright © 2020 biaplutarco. All rights reserved.
//

import UIKit

class TasksViewController: UIViewController {

    var coordinator: TasksCoordinator?

    init() {
        super.init(nibName: nil, bundle: nil)
        tabBarItem = UITabBarItem(title: "Tasks", image: UIImage(), tag: 0)
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
