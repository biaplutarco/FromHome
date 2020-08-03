//
//  SetupTasksView.swift
//  FromHome
//
//  Created by Daniboy on 7/31/20.
//  Copyright © 2020 biaplutarco. All rights reserved.
//

import UIKit

class SetupTasksView: UIView {

    lazy var cardContent = TasksBodyView(getReady: self.viewModel.getReady, goHome: self.viewModel.goHome, delegate: self)

    lazy var  cardView = TitledCardView(titleType: .footer, title: viewModel.title, subView: cardContent)

    let viewModel = TasksFooterViewModel()

    init() {

        super.init(frame: .zero)

        addSubviews([cardView])
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
