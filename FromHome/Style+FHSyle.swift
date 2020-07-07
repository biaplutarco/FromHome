//
//  Style+FHSyle.swift
//  FromHome
//
//  Created by Bia Plutarco on 06/07/20.
//  Copyright © 2020 biaplutarco. All rights reserved.
//

import UIKit

extension Style {
    
    static var myApp: Style {
            return Style( backgroundColor: .black, attributesForStyle: { $0.fhAttributes } )
        }
}

private extension Style.TextStyle {
    
    var fhAttributes: Style.TextAttributes {
        
        switch self {
        
        case .greeting:
           return Style.TextAttributes(font: .myAppTitle, color: .myAppGreen, backgroundColor: .black)
        }
    }
}
