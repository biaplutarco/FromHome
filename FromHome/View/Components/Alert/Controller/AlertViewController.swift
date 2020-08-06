//
//  AlertViewController.swift
//  FromHome
//
//  Created by Bia Plutarco on 25/07/20.
//  Copyright © 2020 biaplutarco. All rights reserved.
//

import UIKit

class AlertViewController: UIViewController {

    private var alertView: AlertView

    let viewModel = AlertControllerViewModel()

    var alert: Alert

    var alertViewModel: AlertViewModel

    weak var delegate: AlertControllerDelegate?

    init(_ alert: Alert) {

        self.alertView = AlertView(alert.viewModel)
        self.alert = alert
        self.alertViewModel = alert.viewModel

        super.init(nibName: nil, bundle: nil)

        self.alertView.delegate = self

        setupView()
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setupView() {

        view.backgroundColor = .backgroundTransparentAlert

        modalTransitionStyle = .crossDissolve
        modalPresentationStyle = .overCurrentContext

        view.addSubview(alertView)
    }
}
