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
    }
}
