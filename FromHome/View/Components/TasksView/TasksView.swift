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

    let checkListStackView = UIStackView(subviews: [], alignment: .fill, distribution: .fill, axis: .vertical, spacing: 18)

    var viewModel: TasksViewModel

    init(viewModel: TasksViewModel) {

        self.viewModel = viewModel
        self.cardView = TitledCardView(titleType: .header, title: viewModel.title, subView: checkListStackView, type: .header)

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

            self.checkListStackView.addArrangedSubview(taskView(task))
        }
    }

    private func taskView(_ taskTitle: String) -> UIStackView {

        let button = checkMarkButton()
        let label = taskLabel(taskTitle)

        let stackView = UIStackView(
            subviews: [button, label],
            alignment: .leading,
            distribution: .fill,
            axis: .horizontal,
            spacing: 18
        )

        label.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            label.heightAnchor.constraint(equalTo: button.heightAnchor)
        ])

        return stackView
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

        guard let superview = superview else { return }

        NSLayoutConstraint.activate([

            leadingAnchor.constraint(equalTo: superview.safeAreaLayoutGuide.leadingAnchor),
            trailingAnchor.constraint(equalTo: superview.safeAreaLayoutGuide.trailingAnchor),
            topAnchor.constraint(equalTo: superview.safeAreaLayoutGuide.topAnchor),

            cardView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            cardView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            cardView.topAnchor.constraint(equalTo: topAnchor, constant: 16)
        ])
    }
}
