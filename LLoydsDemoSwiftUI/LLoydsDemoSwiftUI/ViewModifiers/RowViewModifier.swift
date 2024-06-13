//
//  RowViewModifier.swift
//  LLoydsDemoSwiftUI
//
//  Created by Ankur Bansal on 12/01/24.
//

import Foundation
import SwiftUI
struct RowViewModifier: ViewModifier {
    private var rowBackgroundColor: Color = .clear
    func body(content: Content) -> some View {
        content
            .listRowBackground(rowBackgroundColor)
            .listRowInsets(EdgeInsets())
            .listRowSeparator(.hidden)
        }
}
