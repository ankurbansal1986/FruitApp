//
//  NutritionsViewController.swift
//  LLOYDSDEMO
//
//  Created by Ankur Bansal on 09/01/24.
//

import SwiftUI
struct NutritionsView<T: FruitRenderModel>: View {
    private var viewModel: NutritionsViewModel<T>
    init(viewModel: NutritionsViewModel<T>) {
        self.viewModel = viewModel
    }
    var body: some View {
        ScrollView {
            HStack(alignment: .center, spacing: Constants.padding) {
                VStack(alignment: .leading, spacing: Constants.padding) {
                    Text(viewModel.fruitRenderModel.caloriesString)
                    Text(viewModel.fruitRenderModel.fatString)
                    Text(viewModel.fruitRenderModel.carbohydtrateString)
                    Text(viewModel.fruitRenderModel.sugarString)
                    Text(viewModel.fruitRenderModel.proteinString)
                    
                }
                .modifier(TextModifier())
                .modifier(ForegroundModifier())
            }
            .padding(Constants.padding)
        }
        .modifier(BackgroundModifier())
        .navigationTitle(viewModel.fruitRenderModel.title)
    }
}

#Preview {
    NutritionsView<FruitModel>(viewModel: NutritionsViewModel(fruitRenderModel: FruitModel(name: "Cherry", id: 8, family: "Rosaceae", order: "Rosales", genus: "Prunus",
                                                                                           nutritions: Nutritions(calories: 50, fat: 0.3, sugar: 8.0, carbohydrates: 12.0, protein: 1.0))))
}
