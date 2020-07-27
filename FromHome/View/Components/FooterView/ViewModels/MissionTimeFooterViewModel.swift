//
//  MissionTimeFooterViewModel.swift
//  FromHome
//
//  Created by Bia Plutarco on 26/07/20.
//  Copyright © 2020 biaplutarco. All rights reserved.
//

import Foundation

class MissionTimeFooterViewModel: OptionsFooterViewModel {

    var options: Options { [("Hour", "6"), ("Coffee Break", "15'"), ("Meal Break", "yes")] }

    var type: FooterViewType { .missionTime }

    var title: String { "Mission's Time" }
}
