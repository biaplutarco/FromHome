//
//  SetupViewController+GreetingView.swift
//  FromHome
//
//  Created by Daniboy on 7/17/20.
//  Copyright © 2020 biaplutarco. All rights reserved.
//

import UIKit

extension SetupViewController: GreetingViewDelegate {

    func didTapChangeUsername() {

        let alert = AlertViewController(.input(.changeName))
        alert.delegate = self

        present(alert, animated: true, completion: nil)
    }
}
