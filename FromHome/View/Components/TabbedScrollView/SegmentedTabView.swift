//
//  SegmentedTabView.swift
//  FromHome
//
//  Created by Daniboy on 7/17/20.
//  Copyright © 2020 biaplutarco. All rights reserved.
//

import UIKit

protocol SegmentedTabViewDelegate: AnyObject {
    func segmentShouldChange(index: Int)
}

class SegmentedTabView: UIView {

    let buttonImages: [(unselected: UIImage, selected: UIImage)]

    var selectedSegment: Int = 0

    lazy var buttons = buttonImages.map({ UIButton.init(image: $0.unselected) })

    lazy var stackView = UIStackView(subviews: self.buttons)

    weak var delegate: SegmentedTabViewDelegate?

    init(_ buttonImages: [(unselected: UIImage, selected: UIImage)]) {
        self.buttonImages = buttonImages

        super.init(frame: .zero)

        styleAsCard(.footer)
        addSubviews([stackView])

        buttons[0].isUserInteractionEnabled = false
        buttons[0].setImage(buttonImages[0].selected, for: .normal)

        buttons.forEach({ $0.addTarget(self, action: #selector(buttonPressed(_:)), for: .touchUpInside) })

        translatesAutoresizingMaskIntoConstraints = false
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func didMoveToSuperview() {
        super.didMoveToSuperview()

        guard let superview = superview else { fatalError("No super view") }

        NSLayoutConstraint.activate([
            leadingAnchor.constraint(equalTo: superview.leadingAnchor, constant: 16),
            trailingAnchor.constraint(equalTo: superview.trailingAnchor, constant: -16),
            bottomAnchor.constraint(equalTo: superview.bottomAnchor, constant: -16),
            heightAnchor.constraint(equalToConstant: 64),

            stackView.topAnchor.constraint(equalTo: topAnchor, constant: 16),
            stackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            stackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            stackView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -16)
        ])
    }

    func selectSegment(index: Int) {
        if index != selectedSegment {
            let unselected = buttons[self.selectedSegment]
            let selected = buttons[index]

            unselected.isUserInteractionEnabled = true
            selected.isUserInteractionEnabled = false

            unselected.setImage(self.buttonImages[self.selectedSegment].unselected, for: .normal)
            selected.setImage(self.buttonImages[index].selected, for: .normal)

            selectedSegment = index

            selected.scale(0.75, withDurarion: 0.15)
//            selected.scale(1.25, withDurarion: 0.15)
        }
    }

    @objc
    func buttonPressed(_ sender: UIButton) {
        guard let index = buttons.firstIndex(of: sender) else { fatalError("button not in array") }

        selectSegment(index: index)
        delegate?.segmentShouldChange(index: index)
    }
}
