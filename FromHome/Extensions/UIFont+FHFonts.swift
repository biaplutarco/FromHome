//
//  UIFont+FHFonts.swift
//  FromHome
//
//  Created by Bia Plutarco on 06/07/20.
//  Copyright © 2020 biaplutarco. All rights reserved.
//

import UIKit

extension UIFont {

    static var greeting: UIFont { UIFont.preferredFont(forTextStyle: .subheadline) }

    static var username: UIFont { UIFont.preferredFont(forTextStyle: .largeTitle) }

    static var titleCardHeader: UIFont { UIFont.preferredFont(forTextStyle: .headline) }

    static var checklist: UIFont { UIFont.preferredFont(forTextStyle: .callout) }

    static var titleCardFooter: UIFont { UIFont.preferredFont(forTextStyle: .headline) }

    static var subtitleCardFooter: UIFont { UIFont.preferredFont(forTextStyle: .callout) }

    static var bodyCardFooter: UIFont { UIFont.preferredFont(forTextStyle: .callout) }

    static var titleAlert: UIFont { UIFont.preferredFont(forTextStyle: .headline) }

    static var titleButton: UIFont { UIFont.preferredFont(forTextStyle: .headline) }

    static var destructiveTitleButton: UIFont { UIFont.preferredFont(forTextStyle: .callout) }

    static var workClockNumbers: UIFont { UIFont.monospacedSystemFont(ofSize: 48, weight: .regular) }

    static var workClockLabels: UIFont { UIFont.preferredFont(forTextStyle: .subheadline) }
}
