//
//  TasksView.swift
//  FromHome
//
//  Created by Bia Plutarco on 03/08/20.
//  Copyright © 2020 biaplutarco. All rights reserved.
//

import UIKit

class TasksView: UIView {

    let cardView: TitledCardView
    let stackView = UIStackView(subviews: [], alignment: .fill, distribution: .fill, axis: .vertical, spacing: 18)

    var viewModel: TasksViewModel

    init(viewModel: TasksViewModel) {

        self.viewModel = viewModel
        self.cardView = TitledCardView(titleType: .header, title: viewModel.title, subView: stackView, type: .header)

        super.init(frame: .zero)

        checkListView(for: viewModel.taskList)
        addSubviews([cardView])
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func checkListView(for list: [String]) {

        list.forEach { task in

            self.stackView.addArrangedSubview(taskView(task))
        }
    }

    private func taskView(_ taskTitle: String) -> UIStackView {

        UIStackView(
            subviews: [checkMarkButton(), taskLabel(taskTitle)],
            alignment: .leading,
            distribution: .fill,
            axis: .horizontal,
            spacing: 18
        )
    }

    private func taskLabel(_ title: String) -> UILabel {

        let label = UILabel()
        label.text = title

        Style.fromHome.apply(textStyle: .checklist, to: label)

        return label
    }

    private func checkMarkButton() -> UIButton {

        let button = UIButton(image: .checklist)
        button.setImage(.checklistFill, for: .selected)
        button.addTarget(self, action: #selector(tapCheckMark(_:)), for: .touchUpInside)

        button.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            button.widthAnchor.constraint(equalTo: button.heightAnchor)
        ])

        return button
    }

    @objc
    func tapCheckMark(_ sender: UIButton) {
        sender.isSelected.toggle()
    }

    override func didMoveToSuperview() {
        super.didMoveToSuperview()

        guard let superview = superview else { fatalError("No super view") }

        NSLayoutConstraint.activate([

            leadingAnchor.constraint(equalTo: superview.safeAreaLayoutGuide.leadingAnchor, constant: 16),
            trailingAnchor.constraint(equalTo: superview.safeAreaLayoutGuide.trailingAnchor, constant: -16),
            topAnchor.constraint(equalTo: superview.safeAreaLayoutGuide.topAnchor, constant: 16),
            heightAnchor.constraint(equalToConstant: 200)
        ])
    }
}
