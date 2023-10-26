//
//  HomeScreenViewModels.swift
//  FoodDelivery
//
//  Created by Ali Çolak on 26.10.2023.
//

import Foundation
import RxSwift
import RxCocoa

class HomeScreenViewModel {
    
    let categories : PublishSubject<[Category]> = PublishSubject()
    let categoriesError : PublishSubject<String> = PublishSubject()
    var popularRestaurants : PublishSubject<[Restaurant]> = PublishSubject()
    let allResturantsError : PublishSubject<String> = PublishSubject()
    let mostPopularRestaurants : PublishSubject<[Restaurant]> = PublishSubject()
    let mostPopularRestaurantsError : PublishSubject<String> = PublishSubject()
    let recentlyItemsRestaurants : PublishSubject<[Restaurant]> = PublishSubject()
    let recentlyItemsRestaurantsError : PublishSubject<String> = PublishSubject()
    let loading : PublishSubject<Bool> = PublishSubject()

    
    var allRestaurants : [Restaurant] = []

    func requestAllData() {
        
        self.loading.onNext(true)
        
        let dispatchGroup = DispatchGroup()
        
        dispatchGroup.enter()
        
        NetworkManager.shared.getAllCategories { result in
            defer {
                dispatchGroup.leave()
            }
            switch result {
            case .success(let categories):
                self.categories.onNext(categories)
            case .failure(let error):
                switch error {
                case .urlError:
                    self.categoriesError.onNext("There is an error in the url")
                case .decodingError:
                    self.categoriesError.onNext("There is an Error in Model or JSON data")
                case .serverError:
                    self.categoriesError.onNext("There is a problem with the server")
                }
            }
            
        }
        
        dispatchGroup.enter()
        NetworkManager.shared.getAllRestaurants { result in
            defer {
                dispatchGroup.leave()
            }
            switch result {
            case .success(let restaurants):
                self.allRestaurants = restaurants
                let firstThreeRestaurants = Array(restaurants.prefix(3))
                self.popularRestaurants.onNext(firstThreeRestaurants)
            case .failure(let error):
                switch error {
                case .urlError:
                    self.allResturantsError.onNext("There is an error in the url")
                case .decodingError:
                    self.allResturantsError.onNext("There is an Error in Model or JSON data")
                case .serverError:
                    self.allResturantsError.onNext("There is a problem with the server")
                }
            }
            
        }
        
        dispatchGroup.enter()
        NetworkManager.shared.getMostPopularRestaurants { result in
            defer {
                dispatchGroup.leave()
            }
            switch result {
            case .success(let restaurants):
                self.mostPopularRestaurants.onNext(restaurants)
            case .failure(let error):
                switch error {
                case .urlError:
                    self.mostPopularRestaurantsError.onNext("There is an error in the url")
                case .decodingError:
                    self.mostPopularRestaurantsError.onNext("There is an Error in Model or JSON data")
                case .serverError:
                    self.mostPopularRestaurantsError.onNext("There is a problem with the server")
                }
            }
            
        }
        
        dispatchGroup.enter()
        NetworkManager.shared.getRecentlyItemsRestaurants { result in
            defer {
                dispatchGroup.leave()
            }
            switch result {
            case .success(let restaurants):
                self.recentlyItemsRestaurants.onNext(restaurants)
            case .failure(let error):
                switch error {
                case .urlError:
                    self.recentlyItemsRestaurantsError.onNext("There is an error in the url")
                case .decodingError:
                    self.recentlyItemsRestaurantsError.onNext("There is an Error in Model or JSON data")
                case .serverError:
                    self.recentlyItemsRestaurantsError.onNext("There is a problem with the server")
                }
            }
            
        }
        
        
        dispatchGroup.notify(queue: .main) {
            self.loading.onNext(false)
        }
        
    }
    
    func changeCategory(categoryId: Int) {
        
        let filteredRestaurants = self.allRestaurants.filter { $0.categoryId == categoryId }

        let randomRestaurants = selectRandomRestaurants(from: filteredRestaurants, count: 3)
        
        self.popularRestaurants.onNext(randomRestaurants)
        
    }

    func selectRandomRestaurants(from restaurants: [Restaurant], count: Int) -> [Restaurant] {
        var randomRestaurants: [Restaurant] = []
        if restaurants.count <= count {
            randomRestaurants = restaurants
        } else {
            var shuffledRestaurants = restaurants.shuffled()
            for i in 0..<count {
                randomRestaurants.append(shuffledRestaurants[i])
            }
        }
        return randomRestaurants
    }

    
}






