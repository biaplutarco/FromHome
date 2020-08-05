//
//  SetupTodayView.swift
//  FromHome
//
//  Created by Daniboy on 7/31/20.
//  Copyright © 2020 biaplutarco. All rights reserved.
//

import UIKit

protocol SetupTodayViewDelegate: AnyObject {
    func startTodayButtonPressed(_ setupTodayView: SetupTodayView)
}

class SetupTodayView: UIView {

    let cardView: TitledCardView

    let cardContent: TodayBodyView

    let viewModel = TodayFooterViewModel()

    weak var delegate: SetupTodayViewDelegate?

    init(_ delegate: SetupTodayViewDelegate? = nil) {

        cardContent = TodayBodyView.init(buttonTitle: viewModel.buttonTitle, bodyText: viewModel.bodyText)
        cardView = TitledCardView(titleType: .footer, title: viewModel.title, subView: cardContent, type: .footer)

        super.init(frame: .zero)

        addSubviews([cardView])

        cardContent.button.addTarget(self, action: #selector(startTodayButtonPressed(_:)), for: .touchUpInside)
        self.delegate = delegate
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    @objc
    func startTodayButtonPressed(_ sender: UIButton) {

        sender.scale(0.97, withDurarion: 0.1) {

            self.delegate?.startTodayButtonPressed(self)
        }
    }
}
