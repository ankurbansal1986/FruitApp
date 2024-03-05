//
//  FruitsDataRepository.swift
//  LLoydsDemoSwiftUI
//
//  Created by Ankur Bansal on 19/02/24.
//

import Foundation

struct FruitsDataRepository: FruitsDataRepositoryProtocol {
    private let service: FruitsListServiceable = FruitsListService()
    func getAllFruits() async -> Result<[FruitDomainModel], RequestError> {
        return await self.service.getAllFruits()
    }
}

