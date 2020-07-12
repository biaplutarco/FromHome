//
//  TodayBodyView.swift
//  FromHome
//
//  Created by Bia Plutarco on 11/07/20.
//  Copyright © 2020 biaplutarco. All rights reserved.
//

import UIKit

class TodayBodyView: UIView {

    private var bodyLabel = UILabel()

    private lazy var button: UIButton = {
        let button = UIButton()
        button.setTitle("Start", for: .normal)
        button.layer.cornerRadius = button.frame.height / 2

        return button
    }()

    private lazy var stackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [bodyLabel, button])
        stackView.alignment = .center
        stackView.axis = .vertical
        stackView.spacing = 12

        return stackView
    }()

    init(title: String) {
        self.bodyLabel.text = "lorem lorem lorem lorem lorem lorem lorem"

        super.init(frame: .zero)

        setupView()
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setupView() {

        addSubview(stackView)

        constraints()
        applyStyle()
    }

    private func applyStyle() {
        Style.fromHome.apply(textStyle: .titleButton, to: button)
    }

    private func constraints() {
        stackView.fulfillSuperview()
    }
}
