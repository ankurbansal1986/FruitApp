//
//  FruitRowView.swift
//  LLoydsDemoSwiftUI
//
//  Created by Ankur Bansal on 11/01/24.
//

import SwiftUI
struct FruitRowView<T: FruitRenderModel>: View {
    var fruitRenderModel: T
    var backgroundColor: Color = .clear
    var body: some View {
        HStack(alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/, spacing: Constants.padding) {
            VStack(alignment: .leading, spacing: Constants.padding) {
                Text(fruitRenderModel.nameString).modifier(TextModifier(fontStyle: .title))
                Text(fruitRenderModel.familyString)
                Text(fruitRenderModel.orderString)
                Text(fruitRenderModel.genusString)
            }
            .padding(.bottom)
            .modifier(TextModifier())
            .background(backgroundColor)
        }
        .background(.clear)
    }
}

#Preview {
    FruitRowView<FruitModel>(fruitRenderModel: FruitModel(name: "Cherry", id: 8, family: "Rosaceae", order: "Rosales", genus: "Prunus", nutritions:
                                                            Nutritions(calories: 50, fat: 0.3, sugar: 8.0, carbohydrates: 12.0, protein: 1.0)), backgroundColor: .red )
}
