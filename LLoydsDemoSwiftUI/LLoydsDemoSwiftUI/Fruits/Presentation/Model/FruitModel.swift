//
//  FruitModel.swift
//  LLOYDSDEMO
//
//  Created by Ankur Bansal on 05/01/24.
//

import Foundation

// MARK: - Fruit
struct FruitModel: Codable, Identifiable {
    let name: String?
    let id: Int?
    let family, order, genus: String?
    let nutritions: Nutritions?
}

// MARK: - Nutritions
struct Nutritions: Codable {
    let calories: Int?
    let fat, sugar, carbohydrates, protein: Float?
}
