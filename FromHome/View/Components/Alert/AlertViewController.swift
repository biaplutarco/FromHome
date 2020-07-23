//
//  AlertViewController.swift
//  FromHome
//
//  Created by Bia Plutarco on 20/07/20.
//  Copyright © 2020 biaplutarco. All rights reserved.
//

import UIKit

class AlertViewController: UIViewController {

    private var alertView: AlertView

    init(_ alert: Alert) {
        self.alertView = AlertView(alert.viewModel)

        super.init(nibName: nil, bundle: nil)

        setupView()
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setupView() {

        view.backgroundColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 0.5)

        modalTransitionStyle = .crossDissolve
        modalPresentationStyle = .overCurrentContext

        view.addSubview(alertView)

        constraints()
    }

    private func constraints() {

        alertView.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            alertView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            alertView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            alertView.widthAnchor.constraint(equalToConstant: 300)
        ])
    }
}
