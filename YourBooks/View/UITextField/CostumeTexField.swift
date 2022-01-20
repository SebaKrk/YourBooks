//
//  CostumeTexField.swift
//  YourBooks
//
//  Created by Sebastian Sciuba on 20/01/2022.
//


import UIKit

class CostumeTexField : UITextField {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
        
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    init(placeholder: String ) {
        super.init(frame: .zero)
        self.placeholder = placeholder
        attributedPlaceholder =
        NSAttributedString(string: placeholder,attributes: [.foregroundColor: UIColor(white: 1, alpha: 0.7)])
        configure()
    }
    
    private func configure() {
        keyboardAppearance = .dark
        borderStyle = .none
        textColor = .white
        textAlignment = .center
        backgroundColor =  UIColor(white: 1, alpha: 0.2)
        layer.cornerRadius = 5
    }
}
