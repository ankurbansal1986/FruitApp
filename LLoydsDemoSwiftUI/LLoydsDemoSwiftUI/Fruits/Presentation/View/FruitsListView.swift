//
//  FruitsListView.swift
//  LLOYDSDEMO
//
//  Created by Ankur Bansal on 02/01/24.
//

import UIKit
import SwiftUI
import Foundation

struct FruitsListView<T, U>: View where T: FruitRenderModel, T: Identifiable, U: FruitsUseCaseProtocol {
    @StateObject private var viewModel: FruitsViewModel<T, U>
    
    init(viewModel: FruitsViewModel<T, U>) {
        _viewModel = StateObject(wrappedValue: viewModel)
    }
    
    var body: some View {
        NavigationStack {
            VStack {
                if !viewModel.isDataLoaded {
                    HStack {
                        Spacer()
                        LoaderView()
                        Spacer()
                    }
                    Spacer()
                } else {
                    List(viewModel.fruits) { fruit in
                        NavigationLink(destination: nutritionView(fruitRenderModel: fruit)) {
                            FruitRowView(fruitRenderModel: fruit)
                            
                        }
                        .modifier(RowViewModifier())
                    }
                }
            }
           
            .alert("", isPresented: $viewModel.showAlert) {
            } message: {
                Text(viewModel.errorMessage ?? "")
            }
            .modifier(BackgroundModifier())
            .navigationTitle(String(localized: "Fruits", table: "FruitsLocalization"))
        }
        .onAppear {
            if !viewModel.isDataLoaded {
                Task {
                    await viewModel.getAllFruits()
                }
            }
        }
    }
}

extension FruitsListView: Navigator {}
