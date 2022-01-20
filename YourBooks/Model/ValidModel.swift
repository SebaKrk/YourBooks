//
//  ValidModel.swift
//  YourBooks
//
//  Created by Sebastian Sciuba on 20/01/2022.
//

import Foundation

protocol FormIsValidViewModel {
    var formIsValid : Bool {get}
}

struct ValidModel : FormIsValidViewModel {
    var title : String?
    var author : String?
    var released : String?
    
    
    var formIsValid: Bool {
        return title?.isEmpty == false && author?.isEmpty == false && released?.isEmpty == false 
    }
}
