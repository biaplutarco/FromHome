//
//  SetupViewController+TaskSectionViewDelegate.swift
//  FromHome
//
//  Created by Daniboy on 8/3/20.
//  Copyright © 2020 biaplutarco. All rights reserved.
//

import UIKit

extension SetupViewController: TaskSectionViewDelegate {

    func presentChangeTaskAlert(taskSection: TaskSectionView, index: Int) {
        print("show alert, for section \(taskSection) and index \(index)")

        let alert = AlertViewController(.changeTask(Task(name: "", type: taskSection.type, index: index)))
        alert.delegate = self

        present(alert, animated: true, completion: nil)
    }
}
