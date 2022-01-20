//
//  BookNameLabel.swift
//  YourBooks
//
//  Created by Sebastian Sciuba on 20/01/2022.
//

import Foundation
import UIKit

class BookNameLabel : UILabel {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    private func configure() {
        font = UIFont(name: "Baskerville", size: 24)
        textColor = .black
        textAlignment = .left
        numberOfLines = 1
        lineBreakMode = .byTruncatingTail
    }
}
