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

    private lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.showsVerticalScrollIndicator = false

        return scrollView
    }()

    private lazy var stackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [getReadySectionView, goHomeSectionView])
        stackView.alignment = .center
        stackView.axis = .vertical
        stackView.spacing = 28

        return stackView
    }()

    weak var delegate: TasksBodyViewDelegate?

    init(getReady: (sectionTitle: String, tasks: [String]), goHome: (sectionTitle: String, tasks: [String]), delegate: TaskSectionViewDelegate) {

        self.getReadySectionView = TaskSectionView(sectionTitle: getReady.sectionTitle, tasks: getReady.tasks)
        self.goHomeSectionView = TaskSectionView(sectionTitle: goHome.sectionTitle, tasks: goHome.tasks)

        super.init(frame: .zero)

        self.getReadySectionView.delegate = delegate
        self.goHomeSectionView.delegate = delegate

        addSubviews([scrollView])
        scrollView.addSubview(stackView)
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func didMoveToSuperview() {

        getReadySectionView.translatesAutoresizingMaskIntoConstraints = false
        goHomeSectionView.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([

            getReadySectionView.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.8),
            goHomeSectionView.widthAnchor.constraint(equalTo: getReadySectionView.widthAnchor)
        ])

        scrollView.fulfillSuperview()
        stackView.centeredToSuperview()
    }
}
