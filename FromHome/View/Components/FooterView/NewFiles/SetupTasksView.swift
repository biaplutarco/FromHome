//
//  SetupTasksView.swift
//  FromHome
//
//  Created by Daniboy on 7/31/20.
//  Copyright © 2020 biaplutarco. All rights reserved.
//

import UIKit

class SetupTasksView: UIView {

    let cardView: TitledCardView

    let cardContent: TasksBodyView

    let viewModel = TasksFooterViewModel()

    init() {

        cardContent = TasksBodyView(getReady: viewModel.getReady, goHome: viewModel.goHome)

        cardView = TitledCardView(titleType: .footer, title: viewModel.title, subView: cardContent)

        super.init(frame: .zero)

        addSubviews([cardView])
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
