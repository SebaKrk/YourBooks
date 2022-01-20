//
//  UIViewController+Ext.swift
//  YourBooks
//
//  Created by Sebastian Sciuba on 20/01/2022.
//

import UIKit

extension UIViewController {
    func presentAlertOnMainThred(title: String, message: String) {
        DispatchQueue.main.async {
            let alertVC = AlertViewController(title: title, message: message)
            alertVC.modalPresentationStyle = .overFullScreen
            alertVC.modalTransitionStyle = .crossDissolve
            self.present(alertVC, animated: true, completion: nil)
        }
    }
}
