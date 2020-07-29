//
//  AlertViewController+Delegate.swift
//  FromHome
//
//  Created by Bia Plutarco on 28/07/20.
//  Copyright © 2020 biaplutarco. All rights reserved.
//

import UIKit

protocol AlertControllerDelegate: AnyObject {
    func updateView()
}

extension AlertViewController: AlertViewDelegate {

    func action(withInput input: String?) {

        switch alert {

            case .input(let type):

                switch type {

                    case .changeName:

                        guard let name = input else { return }

                        viewModel.save(name, .changeName)

                    default:
                        break
                    }
            default:
                break
        }

        dismiss(animated: true) {
            self.delegate?.updateView()
        }
    }

    func destructiveAction() {
        dismiss(animated: true, completion: nil)
    }
}
