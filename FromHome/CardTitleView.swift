//
//  CardTitleView.swift
//  FromHome
//
//  Created by Bia Plutarco on 07/07/20.
//  Copyright © 2020 biaplutarco. All rights reserved.
//

import UIKit

class CardTitleView: UIView {
    
    enum CardType {
        
        case footer
        case header
    }
    
    private var titleLabel: UILabel  = UILabel()
    private var line: UIView  = UIView()
    
    private lazy var stackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [titleLabel, line])
        stackView.alignment = .center
        stackView.axis = .vertical
        
        return stackView
    }()
    
    var type: CardType
    
    init(withTitle title: String, for type: CardType) {
        
        self.titleLabel.text = title
        self.type = type
        
        super.init(frame: .zero)
        
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView() {
        
        addSubview(stackView)
        
        constraints()
        applyStyle()
    }
    
    private func applyStyle() {
           
        switch type {
               
        case .header:
            
            line.backgroundColor = .lineTop
            
            Style.fromHome.apply(textStyle: .titleCardHeader, to: titleLabel)
        case .footer:
            
            line.backgroundColor = .lineBottom
            
            Style.fromHome.apply(textStyle: .titleCardFooter, to: titleLabel)
        }
    }
    
    private func constraints() {
        
        line.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            line.heightAnchor.constraint(equalToConstant: 1),
            line.widthAnchor.constraint(equalTo: stackView.widthAnchor, multiplier: 0.2)
        ])
        
        stackView.fulfillSuperview()
    }
}
