//
//  SetupTasksView.swift
//  FromHome
//
//  Created by Daniboy on 7/31/20.
//  Copyright © 2020 biaplutarco. All rights reserved.
//

import UIKit

class SetupTasksView: UIView {

    let cardContent: TasksBodyView

    let cardView: TitledCardView

    let viewModel = TasksFooterViewModel()

    init(_ delegate: TaskSectionViewDelegate) {

        cardContent = TasksBodyView(getReady: self.viewModel.getReady, goHome: self.viewModel.goHome, delegate: delegate)

        cardView = TitledCardView(titleType: .footer, title: viewModel.title, subView: cardContent, type: .footer)

        super.init(frame: .zero)

        addSubviews([cardView])
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func updateView() {
        cardContent.updateView(getReadyTasks: viewModel.getReady.tasks, goHomeTasks: viewModel.goHome.tasks)
    }

    override func didMoveToSuperview() {
        super.didMoveToSuperview()

        NSLayoutConstraint.activate([
            cardView.topAnchor.constraint(equalTo: topAnchor),
            cardView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            cardView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            cardView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 0)
        ])
    }
}
