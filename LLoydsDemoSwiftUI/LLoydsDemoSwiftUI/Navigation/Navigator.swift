//
//  Navigator.swift
//  LLOYDSDEMO
//
//  Created by Ankur Bansal on 09/01/24.
//

import Foundation

protocol Navigator {
    
    // Returns Root View
    func rootView() -> FruitsListView<FruitModel, FruitsUseCases<FruitsDataRepository>>
    
    // Returns nutritions view
    func nutritionView<T: FruitRenderModel>(fruitRenderModel: T) -> NutritionsView<T>
    
    // Returns settings view
    func settingsView() -> SettingsView
}

extension Navigator {
    // Returns Root View
    func rootView() -> FruitsListView<FruitModel, FruitsUseCases<FruitsDataRepository>> {
        let useCase = FruitsUseCases(repository: FruitsDataRepository())
        let viewModel = FruitsViewModel<FruitModel, FruitsUseCases>(useCase: useCase)
        return FruitsListView<FruitModel,FruitsUseCases>(viewModel: viewModel)
    }
    
    // Returns nutritions view
    func nutritionView<T: FruitRenderModel>(fruitRenderModel: T) -> NutritionsView<T> {
        return NutritionsView(viewModel: NutritionsViewModel(fruitRenderModel: fruitRenderModel))
    }
    
    // Returns settings view
    func settingsView() -> SettingsView {
        return SettingsView()
    }
}
