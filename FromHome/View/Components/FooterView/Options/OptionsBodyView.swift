//
//  OptionsBodyView.swift
//  FromHome
//
//  Created by Bia Plutarco on 26/07/20.
//  Copyright © 2020 biaplutarco. All rights reserved.
//

import UIKit

class OptionsBodyView: UIView {

    let stackView = UIStackView(subviews: [], alignment: .center, distribution: .fillEqually, axis: .horizontal, spacing: 24)

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

    private func setupView() {

        addSubview(stackView)

        stackView.fulfillSuperview()
    }

    private func setupOptions(_ options: [Option]) {

        options.forEach { option in
            self.stackView.addArrangedSubview(self.optionView(option))
        }
    }

    private func optionView(_ option: Option) -> UIStackView {

        UIStackView(
            subviews: [label(option.title), textField(option.inputSelected, type: option.type)],
            alignment: .center,
            distribution: .fill,
            axis: .vertical,
            spacing: 18
        )
    }

    private func label(_ title: String) -> UILabel {

        let titleLabel = UILabel()
        titleLabel.text = title

        Style.fromHome.apply(textStyle: .bodyCardFooter, to: titleLabel)

        return titleLabel
    }

    private func textField(_ placeholder: String, type: OptionType) -> FHTextField {

        let picker = UIPickerView(type: type)
        picker.delegate = viewModel

        let textField = FHTextField(picker: picker, acessoryView: acessoryView())
        textField.tag = type.rawValue
        textField.delegate = self
        textField.attributedPlaceholder = Style.fromHome.atributedStringFrom(textStyle: .titleButton, to: placeholder)

        return textField
    }

    private func acessoryView() -> UIToolbar {

        let doneButton = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(doneAction))
        let spaceButton = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        let cancelButton = UIBarButtonItem(title: "Cancel", style: .plain, target: self, action: #selector(cancelAction))

        let acessoryView = UIToolbar()
        acessoryView.sizeToFit()
        acessoryView.barStyle = .default
        acessoryView.tintColor = .gradientTop
        acessoryView.setItems([cancelButton, spaceButton, doneButton], animated: true)
        acessoryView.isUserInteractionEnabled = true

        return acessoryView
    }

    private func reloadPlaceholder() {

        self.stackView.arrangedSubviews.forEach { subview in

            guard let stackView = subview as? UIStackView else { return }

            stackView.arrangedSubviews.forEach { subview in

                guard let textField = subview as? UITextField else { return }

                textField.placeholder = self.viewModel.newInput(for: textField.tag)
            }
        }
    }

    @objc
    func doneAction() {

        endEditing(true)

        viewModel.save()

        reloadPlaceholder()
    }

    @objc
    func cancelAction() {
        endEditing(true)
    }
}
