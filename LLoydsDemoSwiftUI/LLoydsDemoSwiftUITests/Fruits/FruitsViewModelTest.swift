//
//  FruitsViewModelTest.swift
//  LLOYDSDEMOTests
//
//  Created by Ankur Bansal on 08/01/24.
//

import XCTest
import SnapshotTesting

@testable import LLoydsDemoSwiftUI
import SwiftUI
final class FruitsViewModelTest: XCTestCase {

    let fruitsViewModel = FruitsViewModel<FruitModel, FruitsUseCases>(useCase: FruitsUseCases(repository: FruitsDataRepository()))
   
    override func setUp() async throws {
       
    }
    
    func testGetAllFruits() {
        Task {
            _ = await fruitsViewModel.getAllFruits()
            DispatchQueue.main.async { [weak self] in
                XCTAssertTrue(self?.fruitsViewModel.fruits.count ?? 0 > 0)
            }
        }
    }
    
    func testCount() {
        setMockdata()
        XCTAssertTrue(fruitsViewModel.fruits.count == 3)
    }
    
    func testObjects() {
        // positive scenario
        setMockdata()
        var fruit = fruitsViewModel.fruits[0]
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
        fruit = fruitsViewModel.fruits[2]
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
    
    func setMockdata() {
        fruitsViewModel.fruits = [FruitModel(name: "Cherry", id: 8, family: "Rosaceae", order: "Rosales", genus: "Prunus", nutritions: 
                                                Nutritions(calories: 50, fat: 0.3, sugar: 8.0, carbohydrates: 12.0, protein: 1.0)),
                                  FruitModel(name: "Pomelo", id: 1, family: "Rutaceae", order: "Sapindales", genus: "Citrus", nutritions:
                                                Nutritions(calories: 37, fat: 0.2, sugar: 8.5, carbohydrates: 9.67, protein: 0.82)),
                                  FruitModel(name: nil, id: nil, family: nil, order: nil, genus: nil, nutritions: nil)]
       }
    
    func testFruitsList() {
        setMockdata()
        fruitsViewModel.isDataLoaded = true
        let fruitList = FruitsListView<FruitModel, FruitsUseCases>(viewModel: fruitsViewModel).environmentObject(Theme())
        let viewControler = fruitList.toViewController()
        viewControler.performSnapshotTests(named: "FruitList")
    }
}

extension View {
    func toViewController() -> UIViewController {
        let viewController = UIHostingController(rootView: self)
        viewController.view.frame = UIScreen.main.bounds
        return viewController
    }
}

extension UIViewController {
    func performSnapshotTests(
            named name: String,
            precision: Float = 0.99,
            testName: String = "Snapshot") {
            assertSnapshot(
                matching: self,
                as: .image(precision: precision),
                named: name,
                testName: testName)
        }
}
