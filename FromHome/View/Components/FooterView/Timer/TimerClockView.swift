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
    private let colonLabel2 = UILabel(text: ":")
    private let secondsNumberLabel = UILabel(text: "--")

    private let hoursLabel = UILabel(text: "hours")
    private let minutesLabel = UILabel(text: "minutes")
    private let secondsLabel = UILabel(text: "seconds")

    init() {
        super.init(frame: .zero)

        translatesAutoresizingMaskIntoConstraints = false

        addSubviews([
            hoursNumberLabel,
            colonLabel,
            minutesNumberLabel,
            colonLabel2,
            secondsNumberLabel,
            hoursLabel,
            minutesLabel,
            secondsLabel
        ])

        setupStyle()
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setupStyle() {
        Style.fromHome.apply(textStyle: .workClockNumbers, to: hoursNumberLabel)
        Style.fromHome.apply(textStyle: .workClockNumbers, to: colonLabel)
        Style.fromHome.apply(textStyle: .workClockNumbers, to: minutesNumberLabel)
        Style.fromHome.apply(textStyle: .workClockNumbers, to: colonLabel2)
        Style.fromHome.apply(textStyle: .workClockNumbers, to: secondsNumberLabel)

        Style.fromHome.apply(textStyle: .workClockLabels, to: hoursLabel)
        Style.fromHome.apply(textStyle: .workClockLabels, to: minutesLabel)
        Style.fromHome.apply(textStyle: .workClockLabels, to: secondsLabel)
    }

    override func didMoveToSuperview() {
        super.didMoveToSuperview()

        NSLayoutConstraint.activate([

            hoursNumberLabel.trailingAnchor.constraint(equalTo: colonLabel.leadingAnchor, constant: -16),
            hoursNumberLabel.centerYAnchor.constraint(equalTo: colonLabel.centerYAnchor),

            colonLabel.topAnchor.constraint(equalTo: topAnchor),
            colonLabel.centerYAnchor.constraint(equalTo: minutesNumberLabel.centerYAnchor),

            minutesNumberLabel.topAnchor.constraint(equalTo: topAnchor),
            minutesNumberLabel.leadingAnchor.constraint(equalTo: colonLabel.trailingAnchor, constant: 16),
            minutesNumberLabel.trailingAnchor.constraint(equalTo: colonLabel2.leadingAnchor, constant: -16),
            minutesNumberLabel.centerXAnchor.constraint(equalTo: centerXAnchor),

            colonLabel2.topAnchor.constraint(equalTo: topAnchor),
            colonLabel2.centerYAnchor.constraint(equalTo: minutesNumberLabel.centerYAnchor),

            secondsNumberLabel.leadingAnchor.constraint(equalTo: colonLabel2.trailingAnchor, constant: 16),
            secondsNumberLabel.centerYAnchor.constraint(equalTo: colonLabel2.centerYAnchor),

            hoursLabel.topAnchor.constraint(equalTo: hoursNumberLabel.bottomAnchor, constant: 4),
            hoursLabel.centerXAnchor.constraint(equalTo: hoursNumberLabel.centerXAnchor),
            hoursLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -16),

            minutesLabel.topAnchor.constraint(equalTo: minutesNumberLabel.bottomAnchor, constant: 4),
            minutesLabel.centerXAnchor.constraint(equalTo: minutesNumberLabel.centerXAnchor),
            minutesLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -16),

            secondsLabel.topAnchor.constraint(equalTo: secondsNumberLabel.bottomAnchor, constant: 4),
            secondsLabel.centerXAnchor.constraint(equalTo: secondsNumberLabel.centerXAnchor),
            secondsLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -16)
        ])
    }

    func updateClock(hours: Int, minutes: Int, seconds: Int) {
        hoursNumberLabel.text = String(format: "%02d", hours)
        minutesNumberLabel.text = String(format: "%02d", minutes)
        secondsNumberLabel.text = String(format: "%02d", seconds)
    }
}
