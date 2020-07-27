//
//  OptionsFooterViewModel.swift
//  
//
//  Created by Bia Plutarco on 26/07/20.
//

import Foundation

typealias Options = [(title: String, input: String)]

protocol OptionsFooterViewModel: FooterViewModel {
    var options: Options { get }
}
