//
//  TasksBodyView.swift
//  FromHome
//
//  Created by Bia Plutarco on 24/07/20.
//  Copyright © 2020 biaplutarco. All rights reserved.
//

import UIKit

class TasksBodyView: UIView {

    private var getReadySectionView: TaskSectionView
    private var goHomeSectionView: TaskSectionView

    private lazy var stackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [getReadySectionView, goHomeSectionView])
        stackView.alignment = .center
        stackView.axis = .vertical
        stackView.spacing = 28

        return stackView
    }()

    private var viewModel: TasksFooterViewModel

    weak var delegate: TasksBodyViewDelegate?

    init(viewModel: TasksFooterViewModel) {

        self.viewModel = viewModel

        self.getReadySectionView = TaskSectionView(sectionTitle: viewModel.getReady.sectionTitle, tasks: viewModel.getReady.tasks)
        self.goHomeSectionView = TaskSectionView(sectionTitle: viewModel.goHome.sectionTitle, tasks: viewModel.goHome.tasks)

        super.init(frame: .zero)

        self.getReadySectionView.delegate = self
        self.goHomeSectionView.delegate = self

        setupView()
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setupView() {

        addSubview(stackView)

        contraints()
    }

    private func contraints() {

        getReadySectionView.translatesAutoresizingMaskIntoConstraints = false
        goHomeSectionView.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([

            getReadySectionView.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.8),
            goHomeSectionView.widthAnchor.constraint(equalTo: getReadySectionView.widthAnchor)
        ])

        stackView.fulfillSuperview()
    }
}
