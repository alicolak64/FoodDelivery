//
//  NetworkManager.swift
//  FoodDelivery
//
//  Created by Ali Çolak on 26.10.2023.
//

import Foundation

final class NetworkManager {
    
    static let shared = NetworkManager()
    
    private struct Constants {
        static let baseURL = AppConstants.baseUrl
    }
    
    enum ServiceError : Error {
        case serverError
        case decodingError
        case urlError
    }
    
    private init() {}
    
    public func getAllCategories(completion: @escaping (Result<[Category],ServiceError>)-> ()) {
        
        if let url = URL(string: Constants.baseURL + AppConstants.getRestaurantCategoriesEndpoint) {
            
            URLSession.shared.dataTask(with: url) { data, response, error in
                if error != nil {
                    completion(.failure(.serverError))
                } else if let data = data {
                    
                    let categoryList = try? JSONDecoder().decode([Category].self, from: data)
                    
                    if let categoryList = categoryList {
                        completion(.success(categoryList))
                    } else {
                        completion(.failure(.decodingError))
                    }
                }
            }.resume()
            
        } else {
            completion(.failure(.urlError))
            return
        }
        
        
    }
    
    
    public func getAllRestaurants(completion: @escaping (Result<[Restaurant],ServiceError>)-> ()) {
        
        if let url = URL(string: Constants.baseURL + AppConstants.getAllRestaurantsEndpoint) {
            
            URLSession.shared.dataTask(with: url) { data, response, error in
                if error != nil {
                    completion(.failure(.serverError))
                } else if let data = data {
                    
                    let restaurantList = try? JSONDecoder().decode([Restaurant].self, from: data)
                    
                    if let restaurantList = restaurantList {
                        completion(.success(restaurantList))
                    } else {
                        completion(.failure(.decodingError))
                    }
                }
            }.resume()
            
        } else {
            completion(.failure(.urlError))
            return
        }
        
    }
    
    public func getMostPopularRestaurants(completion: @escaping (Result<[Restaurant],ServiceError>)-> ()) {
        
        if let url = URL(string: Constants.baseURL + AppConstants.getMostPopularRestaurantsEndpoint) {
            
            URLSession.shared.dataTask(with: url) { data, response, error in
                if error != nil {
                    completion(.failure(.serverError))
                } else if let data = data {
                    
                    let restaurantList = try? JSONDecoder().decode([Restaurant].self, from: data)
                    
                    if let restaurantList = restaurantList {
                        completion(.success(restaurantList))
                    } else {
                        completion(.failure(.decodingError))
                    }
                }
            }.resume()
            
        } else {
            completion(.failure(.urlError))
            return
        }
    }
    
    public func getRecentlyItemsRestaurants(completion: @escaping (Result<[Restaurant],ServiceError>)-> ()) {
        
        if let url = URL(string: Constants.baseURL + AppConstants.getRecentItemsRestaurantsEndpoint) {
            
            URLSession.shared.dataTask(with: url) { data, response, error in
                if error != nil {
                    completion(.failure(.serverError))
                } else if let data = data {
                    
                    let restaurantList = try? JSONDecoder().decode([Restaurant].self, from: data)
                    
                    if let restaurantList = restaurantList {
                        completion(.success(restaurantList))
                    } else {
                        completion(.failure(.decodingError))
                    }
                }
            }.resume()
            
        } else {
            completion(.failure(.urlError))
            return
        }
    }
    
    
    
}
