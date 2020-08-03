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

        cardView = TitledCardView(titleType: .footer, title: viewModel.title, subView: cardContent)

        super.init(frame: .zero)

        addSubviews([cardView])
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}