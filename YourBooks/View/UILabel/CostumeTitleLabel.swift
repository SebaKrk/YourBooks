//
//  CostumeTitleLabel.swift
//  YourBooks
//
//  Created by Sebastian Sciuba on 20/01/2022.
//

import UIKit
class CostumeTitleLabel : UILabel {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    private func configure() {
        font = UIFont(name: "Baskerville-Bold", size: 32)
        textColor = .white
        textAlignment = .center
        numberOfLines = 1
        lineBreakMode = .byTruncatingTail
    }
}
