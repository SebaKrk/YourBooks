//
//  ErrorMessage.swift
//  YourBooks
//
//  Created by Sebastian Sciuba on 20/01/2022.
//

import Foundation

enum ErrorMessage : String,Error {
    case unableToFavorite = "There was an error favoriting this Book. Please try again."
    case alleredyInFavorites = "You've allredy add this Book. You must very like it!"
}

enum Messages : String {
    case successfullyAdded = "You've successfully added this Book to your favorites"
    case emptyList = "Your List is empty.\nYou haven't added anything yet"
    case successfullyRemove = "You've successfully remove this Book from your favorites"
}

