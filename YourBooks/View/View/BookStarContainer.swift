//
//  BookStarContainer.swift
//  YourBooks
//
//  Created by Sebastian Sciuba on 20/01/2022.
//

import UIKit

class BookStarContainer : UIView {
    
    let star = StarRating()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    init(text: String ) {
        super.init(frame: .zero)
        
        configure()
    }
    
    private func configure() {
        backgroundColor = UIColor(displayP3Red: 37, green: 37, blue: 37, alpha: 0.3)
        layer.cornerRadius = 15
        layer.borderWidth  = 0.5
        layer.borderColor = UIColor.lightGray.cgColor
     
        addSubview(star)
        star.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            star.centerXAnchor.constraint(equalTo: centerXAnchor),
            star.centerYAnchor.constraint(equalTo: centerYAnchor),
            star.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.8)
        ])
    }
}
