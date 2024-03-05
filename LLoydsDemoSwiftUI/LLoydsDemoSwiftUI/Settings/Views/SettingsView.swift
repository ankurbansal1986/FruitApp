//
//  SettingsView.swift
//  LLoydsDemoSwiftUI
//
//  Created by Ankur Bansal on 15/01/24.
//

import Foundation
import SwiftUI
struct SettingsView: View {
    @EnvironmentObject private var theme: Theme
    @State private var selectedTextColor: Color = Theme().textColor
    @State private var selectedBackgroundColor: Color = Theme().backgroundColor
   
    var body: some View {
        NavigationStack {
            VStack(spacing: 20) {
                ColorPicker(String(localized: "Select text Color", table: "FruitsLocalization"),
                            selection: $selectedTextColor)
                .modifier(PaddingModifier())
                
                ColorPicker(String(localized: "Select background Color", table: "FruitsLocalization"),
                            selection: $selectedBackgroundColor)
                .modifier(PaddingModifier())
                
                Button(String(localized: "Update", table: "FruitsLocalization")) {
                    theme.backgroundColor = selectedBackgroundColor
                    theme.textColor = selectedTextColor
                    UserDefaults.standard.setValue(selectedBackgroundColor.rawValue, forKey: Constants.backgroundColor)
                    UserDefaults.standard.setValue(selectedTextColor.rawValue, forKey: Constants.textColor)
                }
                Spacer()
            }
            .modifier(TextModifier())
            .modifier(BackgroundModifier())
            .navigationTitle(String(localized: "Settings", table: "FruitsLocalization"))
        }
        
    }
}
