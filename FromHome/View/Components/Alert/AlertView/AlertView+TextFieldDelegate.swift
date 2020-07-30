//
//  AlertView+TextFieldDelegate.swift
//  FromHome
//
//  Created by Bia Plutarco on 29/07/20.
//  Copyright © 2020 biaplutarco. All rights reserved.
//

import UIKit

extension AlertView: UITextFieldDelegate {

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {

        textField.resignFirstResponder()

        return true
    }
}
