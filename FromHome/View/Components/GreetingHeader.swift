//
//  GreetingHeader.swift
//  FromHome
//
//  Created by Bia Plutarco on 09/07/20.
//  Copyright © 2020 biaplutarco. All rights reserved.
//

import UIKit

class GreetingHeader: UIView {

    private var cardView = UIView(cardType: .header)
    private var greetingLabel = UILabel()
    private var usernameLabel = UILabel()
    
    private lazy var stackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [greetingLabel, usernameLabel])
        stackView.alignment = .leading
        stackView.axis = .vertical

        return stackView
    }()
    
    init(withTitle title: String) {

        super.init(frame: .zero)

        setupView()
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setupView() {

        addSubview(stackView)

        constraints()
        applyStyle()
    }
    
    private func constraints() {
        
    }
    
    private func applyStyle() {

        Style.fromHome.apply(textStyle: .greeting, to: greetingLabel)
        Style.fromHome.apply(textStyle: .username, to: usernameLabel)
    }
}
