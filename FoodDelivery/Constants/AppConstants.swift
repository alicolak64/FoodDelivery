//
//  AppConstants.swift
//  FoodDelivery
//
//  Created by Ali Çolak on 25.10.2023.
//

import UIKit

struct AppConstants {
    static let deviceWidth = UIScreen.main.bounds.width
    static let deviceHeight = UIScreen.main.bounds.height
    static let initialTab = 2
    static let baseUrl = "https://alicolak64.github.io/FoodDeliveryDB/"
    static let getAllRestaurantsEndpoint = "allRestaurants.json"
    static let getMostPopularRestaurantsEndpoint = "mostPopularRestaurants.json"
    static let getRecentItemsRestaurantsEndpoint = "recentItemsRestaurants.json"
    static let getRestaurantCategoriesEndpoint = "restaurantCategories.json"
}
