//
//  SetupNotificationView.swift
//  FromHome
//
//  Created by Daniboy on 7/31/20.
//  Copyright © 2020 biaplutarco. All rights reserved.
//

import UIKit

class SetupNotificationView: UIView {

    let cardView: TitledCardView

    let cardContent: OptionsBodyView

    let viewModel = NotificationFooterViewModel()

    init() {

        cardContent = OptionsBodyView(options: viewModel.options, viewModel: viewModel)

        cardView = TitledCardView(titleType: .footer, title: viewModel.title, subView: cardContent, type: .footer)

        super.init(frame: .zero)

        addSubviews([cardView])
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func didMoveToSuperview() {
        super.didMoveToSuperview()

        NSLayoutConstraint.activate([
            cardView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            cardView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            cardView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 0)
        ])
    }
}
