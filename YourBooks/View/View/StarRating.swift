//
//  StarRating.swift
//  YourBooks
//
//  Created by Sebastian Sciuba on 20/01/2022.
//

import Foundation
import UIKit

class StarRating : UIView {
    
    var starStackView = UIStackView()
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        setupStackView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    private func setupStackView() {
        addSubview(starStackView)
        starStackView.axis = .horizontal
        starStackView.distribution = .fillEqually
        starStackView.spacing = 10
        addButtonsToStackView()
        configureStarStackView()
    }
    func addButtonsToStackView() {
        let nummerOfStars = 5
        
        for _ in 1...nummerOfStars {
            let star = UIImageView(image:UIImage(systemName: "star", withConfiguration:UIImage.SymbolConfiguration(weight: .regular))?.withTintColor(.systemPurple, renderingMode: .alwaysOriginal))
            starStackView.addArrangedSubview(star)
        }
    }
    func configureStarStackView(){
        starStackView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            starStackView.centerXAnchor.constraint(equalTo: centerXAnchor),
            starStackView.centerYAnchor.constraint(equalTo: centerYAnchor),
            starStackView.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.7),
            starStackView.heightAnchor.constraint(equalToConstant: 25)
        ])
        
    }
}
