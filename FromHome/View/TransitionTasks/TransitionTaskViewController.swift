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

    convenience init(backgroundView: UIView) {
        self.init(nibName: nil, bundle: nil)

        view = backgroundView
    }

    func backToSetup() {
        dismiss(animated: true, completion: nil)
    }
}
