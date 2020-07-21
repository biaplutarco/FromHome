//
//  PagedScrollView.swift
//  FromHome
//
//  Created by Daniboy on 7/20/20.
//  Copyright © 2020 biaplutarco. All rights reserved.
//

import UIKit

class PagedScrollView: UIScrollView {

    private let pages: [UIView]

    lazy var stackView = UIStackView.init(subviews: pages)

    var currentPage: Float {
        let page = self.contentOffset.x / self.bounds.width
        return Float(page)
    }

    init(_ pages: [UIView]) {
        self.pages = pages

        super.init(frame: .zero)

        translatesAutoresizingMaskIntoConstraints = false
        isPagingEnabled = true
        backgroundColor = .clear
        showsHorizontalScrollIndicator = false
        alwaysBounceVertical = false

        addSubviews([stackView])
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func didMoveToSuperview() {
        super.didMoveToSuperview()

        for view in pages {
            view.heightAnchor.constraint(equalTo: heightAnchor).isActive = true
            view.widthAnchor.constraint(equalTo: widthAnchor).isActive = true
        }

        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: topAnchor),
            stackView.leadingAnchor.constraint(equalTo: leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: trailingAnchor),
            stackView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }

    func scrollToPage(_ page: Int) {
        let width = self.bounds.width
        let height = self.bounds.height

        scrollRectToVisible(CGRect(x: width * CGFloat(page), y: 0, width: width, height: height), animated: true)
    }
}
