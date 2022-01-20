//
//  BookContainerLabel.swift
//  YourBooks
//
//  Created by Sebastian Sciuba on 20/01/2022.
//

import UIKit

class BookContainerLabel : UIView {
    
    let label = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    init(text: String ) {
        super.init(frame: .zero)
        label.text = text
        configure()
    }
    
    private func configure() {
        backgroundColor = UIColor(displayP3Red: 37, green: 37, blue: 37, alpha: 0.3)
        layer.cornerRadius = 15
        layer.borderWidth  = 0.5
        layer.borderColor = UIColor.lightGray.cgColor
        
        addSubview(label)
        
        label.translatesAutoresizingMaskIntoConstraints = false
        label.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        label.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        
        label.textAlignment = .center
        label.textColor = .white
    }
}
