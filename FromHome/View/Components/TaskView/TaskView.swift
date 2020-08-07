//
//  TasksView.swift
//  FromHome
//
//  Created by Bia Plutarco on 03/08/20.
//  Copyright © 2020 biaplutarco. All rights reserved.
//

import UIKit

class TaskView: UIView {

    let imageView: UIImageView

    let taskLabel: UILabel

    var isSelected = false

    init(taskTitle: String) {
        imageView = UIImageView(image: .checklist)
        taskLabel = UILabel.init(text: taskTitle, textAlignment: .natural)

        super.init(frame: .zero)

        if taskTitle.isEmpty {

            imageView.isHidden = taskTitle.isEmpty

            toggleState()
        }

        addSubviews([imageView, taskLabel])

        Style.fromHome.apply(textStyle: .checklist, to: taskLabel)

        translatesAutoresizingMaskIntoConstraints = true
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func didMoveToWindow() {
        super.didMoveToWindow()

        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: topAnchor),
            imageView.leadingAnchor.constraint(equalTo: leadingAnchor),
            imageView.bottomAnchor.constraint(equalTo: bottomAnchor),
            imageView.widthAnchor.constraint(equalTo: imageView.heightAnchor),
            imageView.heightAnchor.constraint(equalToConstant: 24),

            taskLabel.topAnchor.constraint(equalTo: topAnchor),
            taskLabel.leadingAnchor.constraint(equalTo: imageView.trailingAnchor, constant: 16),
            taskLabel.trailingAnchor.constraint(equalTo: trailingAnchor),
            taskLabel.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }

    func toggleState() {
        if isSelected == true {
            imageView.image = .checklist
            isSelected = false
        } else {
            imageView.image = .checklistFill
            isSelected = true
        }
    }
}
