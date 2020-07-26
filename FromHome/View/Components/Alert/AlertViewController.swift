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

    init(_ alert: Alert, delegate: AlertViewDelegate?) {
        self.alertView = AlertView(alert.viewModel)
        self.alertView.delegate = delegate

        super.init(nibName: nil, bundle: nil)

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

        constraints()
    }

    private func constraints() {

        alertView.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([

            alertView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            alertView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 24),
            alertView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -24)
        ])
    }
}
