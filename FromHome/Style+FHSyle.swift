//
//  Style+FHSyle.swift
//  FromHome
//
//  Created by Bia Plutarco on 06/07/20.
//  Copyright © 2020 biaplutarco. All rights reserved.
//

import UIKit

//case greeting
//case username
//
//case titleCardHeader
//case titleTasks
//
//case titleCardFooter
//case subtitleCardFooter
//case bodyCardFooter
//
//case titleAlert
//
//case positiveTitleButton
//case destructiveTitleButton

extension Style {
    
    static var fromHome: Style {
        return Style( backgroundColor: .black, attributesForStyle: { $0.fromHomeAttributes } )
    }
}

private extension Style.TextStyle {
    
    var fromHomeAttributes: Style.TextAttributes {
        
        switch self {
        
        case .greeting:
            
            return Style.TextAttributes(font: .greeting, color: .primaryText)
        case .username:
            
            return Style.TextAttributes(font: .username, color: .primaryText)
        case .titleCardHeader:
            
            return Style.TextAttributes(font: .titleCardHeader, color: .primaryText)
        case .checklist:
            
            return Style.TextAttributes(font: .checklist, color: .secondaryText)
        case .titleCardFooter:
            
            return Style.TextAttributes(font: .titleCardFooter, color: .primaryText)
        case .subtitleCardFooter:
            
            return Style.TextAttributes(font: .subtitleCardFooter, color: .secondaryText)
        case .bodyCardFooter:
            
            return Style.TextAttributes(font: .bodyCardFooter, color: .secondaryText)
        case .titleAlert:
            
            return Style.TextAttributes(font: .titleAlert, color: .primaryText)
        case .titleButton:
            
            return Style.TextAttributes(font: .titleButton, color: .primaryText)
        case .destructiveTitleButton:
            
            return Style.TextAttributes(font: .destructiveTitleButton, color: .secondaryText)
        }
    }
}
