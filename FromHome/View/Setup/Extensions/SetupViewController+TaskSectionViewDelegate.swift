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

        let alert = AlertViewController(.input(.changeTask))
        alert.delegate = self

        present(alert, animated: true, completion: nil)
    }
}
