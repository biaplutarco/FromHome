//
//  FHTextField.swift
//  FromHome
//
//  Created by Bia Plutarco on 26/07/20.
//  Copyright © 2020 biaplutarco. All rights reserved.
//

import UIKit

class FHTextField: UITextField {

    let padding = UIEdgeInsets(top: 2, left: 10, bottom: 2, right: 10)

    init() {
        super.init(frame: .zero)

        backgroundColor = .backgroundButton
        layer.cornerRadius = 8
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func textRect(forBounds bounds: CGRect) -> CGRect { bounds.inset(by: padding) }

    override func placeholderRect(forBounds bounds: CGRect) -> CGRect { bounds.inset(by: padding) }

    override func editingRect(forBounds bounds: CGRect) -> CGRect { bounds.inset(by: padding) }
}
