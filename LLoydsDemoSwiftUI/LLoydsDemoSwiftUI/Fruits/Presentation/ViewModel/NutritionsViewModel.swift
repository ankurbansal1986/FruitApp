//
//  NutritionsViewModel.swift
//  LLoydsDemoSwiftUI
//
//  Created by Ankur Bansal on 23/01/24.
//

import Foundation
final class NutritionsViewModel<T> where T: FruitRenderModel {
    var fruitRenderModel: T
    init(fruitRenderModel: T) {
        self.fruitRenderModel = fruitRenderModel
    }
}
