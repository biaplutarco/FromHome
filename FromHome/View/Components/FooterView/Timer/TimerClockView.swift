//
//  TimerClockView..swift
//  FromHome
//
//  Created by Daniboy on 8/4/20.
//  Copyright © 2020 biaplutarco. All rights reserved.
//

import UIKit

class TimerClockView: UIView {

    private let hoursNumberLabel = UILabel(text: "--")
    private let colonLabel = UILabel(text: ":")
    private let minutesNumberLabel = UILabel(text: "--")

    private let hoursLabel = UILabel(text: "hours")
    private let minutesLabel = UILabel(text: "minutes")

    init() {
        super.init(frame: .zero)

        translatesAutoresizingMaskIntoConstraints = false

        addSubviews([hoursNumberLabel, colonLabel, minutesNumberLabel, hoursLabel, minutesLabel])

        setupStyle()
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func setupStyle() {
        Style.fromHome.apply(textStyle: .workClockNumbers, to: hoursNumberLabel)
        Style.fromHome.apply(textStyle: .workClockNumbers, to: colonLabel)
        Style.fromHome.apply(textStyle: .workClockNumbers, to: minutesNumberLabel)

        Style.fromHome.apply(textStyle: .workClockLabels, to: hoursLabel)
        Style.fromHome.apply(textStyle: .workClockLabels, to: minutesLabel)
    }

    override func didMoveToSuperview() {
        super.didMoveToSuperview()

        NSLayoutConstraint.activate([

            hoursNumberLabel.trailingAnchor.constraint(equalTo: colonLabel.leadingAnchor, constant: -16),
            hoursNumberLabel.centerYAnchor.constraint(equalTo: colonLabel.centerYAnchor),

            colonLabel.topAnchor.constraint(equalTo: topAnchor),
            colonLabel.centerXAnchor.constraint(equalTo: centerXAnchor),

            minutesNumberLabel.leadingAnchor.constraint(equalTo: colonLabel.trailingAnchor, constant: 16),
            minutesNumberLabel.centerYAnchor.constraint(equalTo: colonLabel.centerYAnchor),

            hoursLabel.topAnchor.constraint(equalTo: hoursNumberLabel.bottomAnchor, constant: 4),
            hoursLabel.centerXAnchor.constraint(equalTo: hoursNumberLabel.centerXAnchor),
            hoursLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -16),

            minutesLabel.topAnchor.constraint(equalTo: minutesNumberLabel.bottomAnchor, constant: 4),
            minutesLabel.centerXAnchor.constraint(equalTo: minutesNumberLabel.centerXAnchor),
            minutesLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -16)
        ])
    }

    func updateClock(hours: Int, minutes: Int) {
        hoursNumberLabel.text = "\(hours)"
        minutesNumberLabel.text = "\(minutes)"
    }
}
