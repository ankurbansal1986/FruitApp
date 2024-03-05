//
//  BackgroundModifier.swift
//  LLoydsDemoSwiftUI
//
//  Created by Ankur Bansal on 12/01/24.
//

import Foundation
import SwiftUI
struct BackgroundModifier: ViewModifier {
    @EnvironmentObject private var theme: Theme
    func body(content: Content) -> some View {
        content
            .background(theme.backgroundColor)
            .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, maxHeight: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment: .center)
            .scrollContentBackground(.hidden)
        }
}
