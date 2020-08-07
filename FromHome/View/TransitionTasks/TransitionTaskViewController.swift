//
//  TransitionTaskViewController.swift
//  FromHome
//
//  Created by Daniboy on 8/2/20.
//  Copyright © 2020 biaplutarco. All rights reserved.
//

import UIKit

class TransitionTaskViewController: UIViewController {
    override var preferredStatusBarStyle: UIStatusBarStyle {
        .lightContent
    }

    lazy var cardView = TitledCardView(titleType: .header, title: self.viewModel.title, subView: self.tasksView, type: .header)

    let tasksView: UIStackView

    let taskView1: TaskView
    let taskView2: TaskView
    let taskView3: TaskView

    let backButton = UIButton(cardWithImage: .back)
    let skipButton = UIButton(cardWithImage: .skip)

    let type: TransitionTaskViewModel.TransitionType

    let viewModel: TransitionTaskViewModel

    weak var coordinator: MainCoordinator?

    init(stars: [CAShapeLayer], taskType: TransitionTaskViewModel.TransitionType, coordinator: MainCoordinator) {
        type = taskType

        viewModel = TransitionTaskViewModel.init(taskType: taskType)

        taskView1 = TaskView.init(taskTitle: viewModel.taskList[0])
        taskView2 = TaskView.init(taskTitle: viewModel.taskList[1])
        taskView3 = TaskView.init(taskTitle: viewModel.taskList[2])

        tasksView = UIStackView.init(
            subviews: [taskView1, taskView2, taskView3],
            alignment: .fill,
            distribution: .fillEqually,
            axis: .vertical,
            spacing: 12
        )

        super.init(nibName: nil, bundle: nil)

        taskView1.addGestureRecognizer(UITapGestureRecognizer.init(target: self, action: #selector(taskViewTapped(_:))))
        taskView2.addGestureRecognizer(UITapGestureRecognizer.init(target: self, action: #selector(taskViewTapped(_:))))
        taskView3.addGestureRecognizer(UITapGestureRecognizer.init(target: self, action: #selector(taskViewTapped(_:))))

        view = UniverseView.init(frame: view.frame, stars: stars)

        if taskType == .getReady {
            view.addSubviews([cardView, backButton, skipButton])
        } else {
            view.addSubviews([cardView, skipButton])
        }

        backButton.addTarget(self, action: #selector(backButtonPressed(_:)), for: .touchUpInside)
        skipButton.addTarget(self, action: #selector(skipButtonPressed(_:)), for: .touchUpInside)

        self.coordinator = coordinator

        setupConstraints()
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        if let view = view as? UniverseView {
            view.makeSky()
        }
    }

    @objc
    func taskViewTapped(_ sender: UITapGestureRecognizer) {
        if (taskView1.gestureRecognizers?.contains(sender))! {
            taskView1.toggleState()
        } else if (taskView2.gestureRecognizers?.contains(sender))! {
            taskView2.toggleState()
        } else if (taskView3.gestureRecognizers?.contains(sender))! {
            taskView3.toggleState()
        }

        if taskView1.isSelected && taskView2.isSelected && taskView3.isSelected {
            if type == .goingHome {
                coordinator?.returnToSetup()
            } else {
                if let universeView = view as? UniverseView {
                    coordinator?.startDailyWork(universeView.stars)
                }
            }
        }
    }

    @objc
    func backButtonPressed(_ sender: UIButton) {
        coordinator?.returnToSetup()
    }

    @objc
    func skipButtonPressed(_ sender: UIButton) {

        if type == .goingHome {
            coordinator?.returnToSetup()
        } else {
            if let universeView = view as? UniverseView {
                coordinator?.startDailyWork(universeView.stars)
            }
        }
    }

    private func setupConstraints() {

        if type == .getReady {
            NSLayoutConstraint.activate([
                backButton.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 16),
                backButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -16),
                backButton.heightAnchor.constraint(equalToConstant: 64),
                backButton.widthAnchor.constraint(equalToConstant: 64)
            ])
        }

        NSLayoutConstraint.activate([

            cardView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 16),
            cardView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -16),
            cardView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 16),

            skipButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -16),
            skipButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -16),
            skipButton.heightAnchor.constraint(equalToConstant: 64),
            skipButton.widthAnchor.constraint(equalToConstant: 64)
        ])
    }
}
