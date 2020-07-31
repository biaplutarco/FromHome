//
//  OptionsFooterViewModel.swift
//  
//
//  Created by Bia Plutarco on 26/07/20.
//

import UIKit

struct Option {

    var title: String
    var inputSelected: String
    var type: OptionType
}

protocol OptionsFooterViewModel: FooterViewModel, UIPickerViewDelegate, UIPickerViewDataSource {

    var options: [Option] { get set }

    func save()
}
