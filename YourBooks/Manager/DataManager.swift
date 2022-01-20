//
//  DataManager.swift
//  YourBooks
//
//  Created by Sebastian Sciuba on 20/01/2022.
//

import Foundation

enum DataManagerAcatinType {
    case add, remove
}
enum DataManager {
    
    static private let defaults = UserDefaults.standard
    
    enum Keys {
        static let favorites = "favorites"
    }
    
    static func uppdateWith(favorite: BookModel, actionType: DataManagerAcatinType , completed: @escaping(ErrorMessage?)->Void) {
        retrieveFavorites { result in
            switch result {
            case .success(let favorites):
                var retrivedFavorites = favorites
                
                switch actionType {
                case .add:
                    guard  !retrivedFavorites.contains(favorite) else {
                        completed(.alleredyInFavorites)
                        return
                    }
                    retrivedFavorites.append(favorite)
                case .remove:
                    retrivedFavorites.removeAll {$0.title == favorite.title }
                }
                completed(save(favorites: retrivedFavorites))
            case .failure(let error):
                completed(error)
            }
        }
    }
    
//    MARK: - LOAD Data
    static func retrieveFavorites(completed: @escaping (Result<[BookModel],ErrorMessage>) -> Void) {
        guard let favoritesData = defaults.object(forKey: Keys.favorites) as? Data else {
            completed(.success([]))
            return
        }
        do {
            let decoder = JSONDecoder()
            let favorites = try decoder.decode([BookModel].self, from: favoritesData)
            completed(.success(favorites))
            
        } catch {
            completed(.failure(.unableToFavorite))
        }
    }
//    MARK: - SAVE data
    static func save(favorites: [BookModel]) -> ErrorMessage? {
        do {
            let encoder = JSONEncoder()
            let encoderFavories = try encoder.encode(favorites)
            defaults.set(encoderFavories, forKey: Keys.favorites)
            return nil
        } catch {
            return .unableToFavorite
        }
    }
}
