//
//  Style.swift
//  FromHome
//
//  Created by Bia Plutarco on 06/07/20.
//  Copyright © 2020 biaplutarco. All rights reserved.
//

import UIKit

class Style {
    
    enum TextStyle {
        
        case greeting
        case username
        
        case titleCardHeader
        case checklist
        
        case titleCardFooter
        case subtitleCardFooter
        case bodyCardFooter
        
        case titleAlert
        
        case titleButton
        case destructiveTitleButton
    }
    
    struct TextAttributes {
        
        let font: UIFont
        let color: UIColor
        let backgroundColor: UIColor?
        
        init(font: UIFont, color: UIColor, backgroundColor: UIColor? = nil) {
            self.font = font
            self.color = color
            self.backgroundColor = backgroundColor
        }
    }
    
    let backgroundColor: UIColor
    let attributesForStyle: (_ style: TextStyle) -> TextAttributes
    
    init(backgroundColor: UIColor, attributesForStyle: @escaping (_ style: TextStyle) -> TextAttributes) {
        
        self.backgroundColor = backgroundColor
        self.attributesForStyle = attributesForStyle
    }
    
    func font(for style: TextStyle) -> UIFont {
        return attributesForStyle(style).font
    }
    
    func color(for style: TextStyle) -> UIColor {
        return attributesForStyle(style).color
    }
    
    func backgroundColor(for style: TextStyle) -> UIColor? {
        return attributesForStyle(style).backgroundColor
    }
}
