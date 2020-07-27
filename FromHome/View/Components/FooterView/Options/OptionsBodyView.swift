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

    private var viewModel: OptionsFooterViewModel

    init(viewModel: OptionsFooterViewModel) {

        self.viewModel = viewModel

        super.init(frame: .zero)

        setupView()
        setupOptions(viewModel.options)
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setupView() {

        addSubview(stackView)

        stackView.fulfillSuperview()
    }

    private func contraints() { }

    private func setupOptions(_ options: Options) {

        options.forEach { option in
            self.stackView.addArrangedSubview(self.option(title: option.title, placeholder: option.input))
        }
    }

    private func option(title: String, placeholder: String) -> UIStackView {

        let titleLabel = UILabel()
        titleLabel.text = title

        Style.fromHome.apply(textStyle: .bodyCardFooter, to: titleLabel)

        let textField = FHTextField()
        textField.attributedPlaceholder = Style.fromHome.atributedStringFrom(textStyle: .titleButton, to: placeholder)

        return UIStackView(subviews: [titleLabel, textField], alignment: .center, distribution: .fill, axis: .vertical, spacing: 18)
    }
}
