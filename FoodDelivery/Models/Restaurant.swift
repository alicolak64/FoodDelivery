//
//  Restaurant.swift
//  FoodDelivery
//
//  Created by Ali Çolak on 26.10.2023.
//

import Foundation

struct Restaurant: Codable {
    let id: Int
    let name: String
    let image: String
    let description: String
    let categoryId: Int
    let ratingCount: Int
    let rating: Double
}
