//
//  UIFont+FHFonts.swift
//  FromHome
//
//  Created by Bia Plutarco on 06/07/20.
//  Copyright © 2020 biaplutarco. All rights reserved.
//

import UIKit

extension UIFont {
    
    static var greeting: UIFont {
        return UIFont.systemFont(ofSize: 18)
    }
    
    static var username: UIFont {
        return UIFont.boldSystemFont(ofSize: 36)
    }
    
    static var titleCardHeader: UIFont {
        return UIFont.boldSystemFont(ofSize: 16)
    }
    
    static var checklist: UIFont {
        return UIFont.systemFont(ofSize: 16)
    }
    
    static var titleCardFooter: UIFont {
        return UIFont.boldSystemFont(ofSize: 21)
    }
    
    static var subtitleCardFooter: UIFont {
        return UIFont.systemFont(ofSize: 16)
    }
    
    static var bodyCardFooter: UIFont {
        return UIFont.systemFont(ofSize: 14)
    }
    
    static var titleAlert: UIFont {
        return UIFont.boldSystemFont(ofSize: 16)
    }
    
    static var titleButton: UIFont {
        return UIFont.boldSystemFont(ofSize: 16)
    }
    
    static var destructiveTitleButton: UIFont {
        return UIFont.systemFont(ofSize: 16)
    }
}
