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

    init(getReadySection: (sectionTitle: String, tasks: [String]), goHomeSection: (sectionTitle: String, tasks: [String])) {

        self.getReadySectionView = TaskSectionView(sectionTitle: getReadySection.sectionTitle, tasks: getReadySection.tasks)
        self.goHomeSectionView = TaskSectionView(sectionTitle: goHomeSection.sectionTitle, tasks: goHomeSection.tasks)

        super.init(frame: .zero)

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
