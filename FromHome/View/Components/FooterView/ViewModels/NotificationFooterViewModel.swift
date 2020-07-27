//
//  NotificationFooterViewModel.swift
//  FromHome
//
//  Created by Bia Plutarco on 26/07/20.
//  Copyright © 2020 biaplutarco. All rights reserved.
//

import Foundation

class NotificationFooterViewModel: OptionsFooterViewModel {

    var options: Options { [("Enable", "yes"), ("Time to work", "14:00")] }

    var type: FooterViewType { .notification }

    var title: String { "Notification" }
}
