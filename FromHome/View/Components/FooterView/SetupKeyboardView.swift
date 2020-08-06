//
//  SetupKeyboardView.swift
//  FromHome
//
//  Created by Bia Plutarco on 06/08/20.
//  Copyright © 2020 biaplutarco. All rights reserved.
//

import UIKit

class SetupKeyboardView: UIView {

    let cardView: TitledCardView

    var bottomConstraint: NSLayoutConstraint?

    var isKeyboardUp: Bool = false

    init(cardView: TitledCardView) {

        self.cardView = cardView

        super.init(frame: .zero)

        NotificationCenter.default.addObserver(
            self, selector: #selector(keyboardWillShow(notification:)),
            name: UIResponder.keyboardWillShowNotification, object: nil
        )

        NotificationCenter.default.addObserver(
            self, selector: #selector(keyboardWillHide),
            name: UIResponder.keyboardWillHideNotification, object: nil
        )

        addSubviews([cardView])
    }

    deinit {

        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillHideNotification, object: nil)
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    @objc
    func keyboardWillShow(notification: NSNotification) {

        guard let userInfo = notification.userInfo,
            let endValue = userInfo[UIResponder.keyboardFrameEndUserInfoKey] else { return }

        let endRect = convert((endValue as AnyObject).cgRectValue, from: window)
        let keyboardOverlap = frame.maxY - endRect.origin.y

        if !isKeyboardUp {

            bottomConstraint?.isActive = false
            bottomConstraint?.constant = -(keyboardOverlap + 8)
            bottomConstraint?.isActive = true
        }

        UIView.animate(withDuration: 0.5) {
            self.layoutIfNeeded()
            self.isKeyboardUp = true
        }
    }

    @objc
    func keyboardWillHide() {

        if isKeyboardUp {

            bottomConstraint?.isActive = false
            bottomConstraint?.constant = 0
            bottomConstraint?.isActive = true
        }

        UIView.animate(withDuration: 0.5) {
            self.layoutIfNeeded()
            self.isKeyboardUp = false
        }
    }

    override func didMoveToSuperview() {
        super.didMoveToSuperview()

        bottomConstraint = cardView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 0)
        bottomConstraint?.isActive = true

        NSLayoutConstraint.activate([
            cardView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            cardView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16)
        ])
    }
}
