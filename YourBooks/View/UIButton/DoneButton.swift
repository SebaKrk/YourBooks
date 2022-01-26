//
//  DoneButton.swift
//  YourBooks
//
//  Created by Sebastian Sciuba on 20/01/2022.
//

import UIKit

class DoneButton : UIButton {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    private func configure() {
        setTitle("DONE", for: .normal)
        backgroundColor = .systemPurple
        titleLabel?.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        layer.cornerRadius = 5
        isEnabled = false
    }
}
