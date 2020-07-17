//
//  UIView+Subview.swift
//  FromHome
//
//  Created by Daniboy on 7/17/20.
//  Copyright © 2020 biaplutarco. All rights reserved.
//

import UIKit

extension UIView {
    func addSubviewCoveringSuperView(_ view: UIView) {
        self.addSubview(view)

        view.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            view.topAnchor.constraint(equalTo: self.topAnchor),
            view.leftAnchor.constraint(equalTo: self.leftAnchor),
            view.rightAnchor.constraint(equalTo: self.rightAnchor),
            view.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            view.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            view.centerYAnchor.constraint(equalTo: self.centerYAnchor)
        ])
    }

    func addSubviews(_ views: [UIView]) {
        views.forEach { (view: UIView) in
            view.translatesAutoresizingMaskIntoConstraints = false

            self.addSubview(view)
        }
    }
}
