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

    init(_ coordinator: MainCoordinator?) {
        self.coordinator = coordinator

        super.init(nibName: nil, bundle: nil)
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        view = UniverseView(frame: view.frame)
    }
}
