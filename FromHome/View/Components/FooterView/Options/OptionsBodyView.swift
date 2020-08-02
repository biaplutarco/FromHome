//
//  OptionsBodyView.swift
//  FromHome
//
//  Created by Bia Plutarco on 26/07/20.
//  Copyright © 2020 biaplutarco. All rights reserved.
//

import UIKit

class OptionsBodyView: UIView {

    private let stackView = UIStackView(subviews: [], alignment: .center, distribution: .fillEqually, axis: .horizontal, spacing: 24)

    init(options: Options) {

        super.init(frame: .zero)

        addSubviewCoveringSuperView(stackView)

        options.forEach { option in
            self.stackView.addArrangedSubview(self.addOption(title: option.title, placeholder: option.input))
        }
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func addOption(title: String, placeholder: String) -> UIStackView {

        let titleLabel = UILabel()
        titleLabel.text = title

        Style.fromHome.apply(textStyle: .bodyCardFooter, to: titleLabel)

        let textField = FHTextField()
        textField.attributedPlaceholder = Style.fromHome.atributedStringFrom(textStyle: .titleButton, to: placeholder)

        return UIStackView(subviews: [titleLabel, textField], alignment: .center, distribution: .fill, axis: .vertical, spacing: 18)
    }
}
