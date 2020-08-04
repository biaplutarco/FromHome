//
//  UIFont+FHFonts.swift
//  FromHome
//
//  Created by Bia Plutarco on 06/07/20.
//  Copyright © 2020 biaplutarco. All rights reserved.
//

import UIKit

extension UIFont {

    static var greeting: UIFont { UIFont.systemFont(ofSize: 18) }

    static var username: UIFont { UIFont.boldSystemFont(ofSize: 36) }

    static var titleCardHeader: UIFont { UIFont.boldSystemFont(ofSize: 16) }

    static var checklist: UIFont { UIFont.systemFont(ofSize: 16) }

    static var titleCardFooter: UIFont { UIFont.boldSystemFont(ofSize: 21) }

    static var subtitleCardFooter: UIFont { UIFont.systemFont(ofSize: 16) }

    static var bodyCardFooter: UIFont { UIFont.systemFont(ofSize: 14) }

    static var titleAlert: UIFont { UIFont.boldSystemFont(ofSize: 16) }

    static var titleButton: UIFont { UIFont.boldSystemFont(ofSize: 16) }

    static var destructiveTitleButton: UIFont { UIFont.systemFont(ofSize: 16) }

    static var workClockNumbers: UIFont { UIFont.monospacedSystemFont(ofSize: 64, weight: .regular) }

    static var workClockLabels: UIFont { UIFont.systemFont(ofSize: 14) }
}
