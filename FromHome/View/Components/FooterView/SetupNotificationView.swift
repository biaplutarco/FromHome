//
//  SetupNotificationView.swift
//  FromHome
//
//  Created by Daniboy on 7/31/20.
//  Copyright © 2020 biaplutarco. All rights reserved.
//

import UIKit

class SetupNotificationView: SetupKeyboardView {

    let cardContent: OptionsBodyView

    let viewModel = NotificationFooterViewModel()

    init() {
        cardContent = OptionsBodyView(options: viewModel.options, viewModel: viewModel)
        super.init(cardView: TitledCardView(titleType: .footer, title: viewModel.title, subView: cardContent, type: .footer))
    }
}
