//
//  ForegroundModifier.swift
//  LLoydsDemoSwiftUI
//
//  Created by Ankur Bansal on 12/01/24.
//

import Foundation
import SwiftUI
struct ForegroundModifier: ViewModifier {
    @EnvironmentObject private var theme: Theme
    func body(content: Content) -> some View {
        content
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(Constants.padding)
            .background(theme.foregoundColor)
            .cornerRadius(10)
        }
}
