//
//  TransitionTasksView.swift
//  FromHome
//
//  Created by Daniboy on 8/2/20.
//  Copyright © 2020 biaplutarco. All rights reserved.
//

import UIKit

class TransitionTasksView: UIView {

    let cardView: TitledCardView

    let cardContent: TodayBodyView

    let viewModel = TodayFooterViewModel()

    init(_ delegate: SetupTodayViewDelegate? = nil) {

        cardContent = TodayBodyView.init(buttonTitle: viewModel.buttonTitle, bodyText: viewModel.bodyText)
        cardView = TitledCardView(titleType: .footer, title: viewModel.title, subView: cardContent)

        super.init(frame: .zero)

        addSubviews([cardView])
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
