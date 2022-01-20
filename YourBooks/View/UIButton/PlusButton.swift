//
//  PlusButton.swift
//  YourBooks
//
//  Created by Sebastian Sciuba on 20/01/2022.
//

import UIKit

class PlusButton : UIButton {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configure() {
        backgroundColor = .purple
        layer.cornerRadius = 25
        setTitle("+", for: .normal)
        setTitleColor(.white, for: .normal)
    }
}
