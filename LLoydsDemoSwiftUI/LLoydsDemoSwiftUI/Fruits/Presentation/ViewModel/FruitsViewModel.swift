//
//  FruitsViewModel.swift
//  LLOYDSDEMO
//
//  Created by Ankur Bansal on 07/01/24.
//

import Foundation
import SwiftUI

final class FruitsViewModel<T, U>: ObservableObject where T: FruitRenderModel, T: Identifiable, U: FruitsUseCaseProtocol {
    private let service: FruitsListServiceable = FruitsListService()
    @Published var fruits: [T] = []
    @Published var isDataLoaded: Bool = false
    @Published var errorMessage: String?
    var showAlert: Bool = false
    private var useCase: U
    
    init(useCase: U) {
        self.useCase = useCase
    }
    
    func getAllFruits() async {
        let result = await self.useCase.getAllFruits()
        DispatchQueue.main.async {
            switch result {
            case .success(let fruitsList):
                self.fruits = fruitsList as? [T] ?? []
            case .failure(let error):
                self.errorMessage = error.customMessage
                self.showAlert = true
            }
            self.isDataLoaded = true
        }
    }
}
