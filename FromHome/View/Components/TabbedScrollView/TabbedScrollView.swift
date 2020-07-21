//
//  TabbedScrollView.swift
//  FromHome
//
//  Created by Daniboy on 7/17/20.
//  Copyright © 2020 biaplutarco. All rights reserved.
//

import UIKit

class TabbedScrollView: UIView {

    let pagedScrollView: PagedScrollView

    let segmentedTabView: SegmentedTabView

    init(views: [UIView], images: [(UIImage, UIImage)]) {

        pagedScrollView = PagedScrollView.init(views)
        segmentedTabView = SegmentedTabView.init(images)

        super.init(frame: .zero)

        pagedScrollView.delegate = self
        segmentedTabView.delegate = self

        addSubviews([pagedScrollView, segmentedTabView])
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func didMoveToSuperview() {
        super.didMoveToSuperview()

        guard let superview = superview else { fatalError("No super view") }

        NSLayoutConstraint.activate([
            leadingAnchor.constraint(equalTo: superview.safeAreaLayoutGuide.leadingAnchor),
            trailingAnchor.constraint(equalTo: superview.safeAreaLayoutGuide.trailingAnchor),
            bottomAnchor.constraint(equalTo: superview.safeAreaLayoutGuide.bottomAnchor),

            pagedScrollView.topAnchor.constraint(equalTo: topAnchor),
            pagedScrollView.leadingAnchor.constraint(equalTo: leadingAnchor),
            pagedScrollView.trailingAnchor.constraint(equalTo: trailingAnchor),

            segmentedTabView.topAnchor.constraint(equalTo: pagedScrollView.bottomAnchor, constant: 16)
        ])
    }}
