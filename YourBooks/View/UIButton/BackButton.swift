//
//  BackButton.swift
//  YourBooks
//
//  Created by Sebastian Sciuba on 20/01/2022.
//

import UIKit

class BackButton : UIButton {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    private func configure() {
        setImage(UIImage(systemName: "arrow.backward", withConfiguration:UIImage.SymbolConfiguration(weight: .regular))?.withTintColor(.systemPurple, renderingMode: .alwaysOriginal), for: .normal)
    
        heightAnchor.constraint(equalToConstant: 50).isActive = true
        widthAnchor.constraint(equalToConstant: 50).isActive = true
        
    }
}
