//
//  UIView+Ext.swift
//  YourBooks
//
//  Created by Sebastian Sciuba on 20/01/2022.
//

import UIKit

extension UIView  {
    
    public func setGradien(colorOne: UIColor, colorTwo: UIColor) {
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = bounds
        gradientLayer.colors =  [colorOne.cgColor, colorTwo.cgColor]
        gradientLayer.locations = [0.3, 0.7]
        layer.insertSublayer(gradientLayer, at: 1)
    }
    
    func addDismissKeyboardOnTapGesture() {
        let tap = UITapGestureRecognizer(target: self, action: #selector(UIView.endEditing))
        addGestureRecognizer(tap)
    }
}
