//
//  FruitsUseCase.swift
//  LLoydsDemoSwiftUI
//
//  Created by Ankur Bansal on 19/02/24.
//

import Foundation
typealias FruitDomainModel = FruitModel

protocol FruitsUseCaseProtocol {
    func getAllFruits() async -> Result<[FruitDomainModel], RequestError>
}

struct FruitsUseCases<T: FruitsDataRepositoryProtocol>: FruitsUseCaseProtocol {
    
    private let repository: T
    
    init(repository: T) {
        self.repository = repository
    }
    
    func getAllFruits() async -> Result<[FruitDomainModel], RequestError> {
        return await repository.getAllFruits()
    }
}
