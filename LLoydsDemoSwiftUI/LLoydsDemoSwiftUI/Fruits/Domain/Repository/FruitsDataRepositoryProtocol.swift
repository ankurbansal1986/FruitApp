//
//  FruitsDataRepositoryProtocol.swift
//  LLoydsDemoSwiftUI
//
//  Created by Ankur Bansal on 19/02/24.
//

import Foundation
protocol FruitsDataRepositoryProtocol {
    func getAllFruits() async -> Result<[FruitDomainModel], RequestError>
}
