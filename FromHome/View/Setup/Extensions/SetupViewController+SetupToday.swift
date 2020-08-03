//
//  SetupViewController+SetupToday.swift
//  FromHome
//
//  Created by Daniboy on 8/2/20.
//  Copyright © 2020 biaplutarco. All rights reserved.
//

import UIKit

extension SetupViewController: SetupTodayViewDelegate {
    func startTodayButtonPressed(_ setupTodayView: SetupTodayView) {
        guard let universeView = view as? UniverseView else {
            fatalError("ja era")
        }

        let universeViewReplica = UniverseView.init(frame: universeView.frame, stars: universeView.stars)

        coordinator?.startDailyWork(universeViewReplica)
    }
}
