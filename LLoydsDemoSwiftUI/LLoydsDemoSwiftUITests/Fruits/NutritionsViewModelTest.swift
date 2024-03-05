//
//  NutritionsViewModelTest.swift
//  LLoydsDemoSwiftUITests
//
//  Created by Ankur Bansal on 23/01/24.
//

import XCTest
@testable import LLoydsDemoSwiftUI
final class NutritionsViewModelTest: XCTestCase {
    
    func testFruitRenderObject() {
        // positive scenario
        var nutritionsViewModel = NutritionsViewModel(fruitRenderModel: FruitModel(name: "Cherry", id: 8, family: "Rosaceae", order: "Rosales", genus: "Prunus", nutritions:
                                                                                    Nutritions(calories: 50, fat: 0.3, sugar: 8.0, carbohydrates: 12.0, protein: 1.0)))
        var fruit = nutritionsViewModel.fruitRenderModel
        XCTAssertTrue(fruit.nameString == "Name: Cherry")
        XCTAssertTrue(fruit.familyString == "Family: Rosaceae")
        XCTAssertTrue(fruit.orderString == "Order: Rosales")
        XCTAssertTrue(fruit.genusString == "Genus: Prunus")
        XCTAssertTrue(fruit.caloriesString == "Calories: 50")
        XCTAssertTrue(fruit.fatString == "Fat: 0.3")
        XCTAssertTrue(fruit.carbohydtrateString == "Carbohydrates: 12.0")
        XCTAssertTrue(fruit.proteinString == "Protein: 1.0")
        XCTAssertTrue(fruit.sugarString == "Sugar: 8.0")
        XCTAssertTrue(fruit.title == "Cherry")
        
        // negative scenario
        nutritionsViewModel = NutritionsViewModel(fruitRenderModel: FruitModel(name: nil, id: nil, family: nil, order: nil, genus: nil, nutritions: nil))
        
        fruit = nutritionsViewModel.fruitRenderModel
        XCTAssertTrue(fruit.nameString == "Name: ")
        XCTAssertTrue(fruit.familyString == "Family: ")
        XCTAssertTrue(fruit.orderString == "Order: ")
        XCTAssertTrue(fruit.genusString == "Genus: ")
        XCTAssertTrue(fruit.caloriesString == "Calories: 0")
        XCTAssertTrue(fruit.fatString == "Fat: 0.0")
        XCTAssertTrue(fruit.carbohydtrateString == "Carbohydrates: 0.0")
        XCTAssertTrue(fruit.proteinString == "Protein: 0.0")
        XCTAssertTrue(fruit.sugarString == "Sugar: 0.0")
        XCTAssertTrue(fruit.title.isEmpty)
    }
}
