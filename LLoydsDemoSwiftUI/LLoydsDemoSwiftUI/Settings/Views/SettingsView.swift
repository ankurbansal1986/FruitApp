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
    @State private var selectedForegroundColor: Color = Theme().foregoundColor
    @State private var selectedTitleColor: Color = Theme().titleColor
    
    var body: some View {
        NavigationStack {
            ScrollView {
                HStack {
                    VStack {
                        VStack(spacing: 20) {
                            ColorPicker(String(localized: "Select text Color", table: "FruitsLocalization"),
                                        selection: $selectedTextColor)
                            .modifier(PaddingModifier())
                            
                            ColorPicker(String(localized: "Select title Color", table: "FruitsLocalization"),
                                        selection: $selectedTitleColor)
                            .modifier(PaddingModifier())
                            
                            ColorPicker(String(localized: "Select background Color", table: "FruitsLocalization"),
                                        selection: $selectedBackgroundColor)
                            .modifier(PaddingModifier())
                            
                            ColorPicker(String(localized: "Select foreground Color", table: "FruitsLocalization"),
                                        selection: $selectedForegroundColor)
                            .modifier(PaddingModifier())
                            
                            Button(String(localized: "Update", table: "FruitsLocalization")) {
                                theme.backgroundColor = selectedBackgroundColor
                                theme.textColor = selectedTextColor
                                theme.foregoundColor = selectedForegroundColor
                                theme.titleColor = selectedTitleColor
                                UserDefaults.standard.setValue(selectedBackgroundColor.rawValue, forKey: Constants.backgroundColor)
                                UserDefaults.standard.setValue(selectedTextColor.rawValue, forKey: Constants.textColor)
                                UserDefaults.standard.setValue(selectedForegroundColor.rawValue, forKey: Constants.foregroundColor)
                                UserDefaults.standard.setValue(selectedTitleColor.rawValue, forKey: Constants.titleColor)
                            }
                        }
                        .modifier(TextModifier())
                        
                        .modifier(ForegroundModifier())
                        Spacer()
                        
                    }
                    .navigationTitle(String(localized: "Settings", table: "FruitsLocalization"))
                }
                .padding(Constants.padding)
            }
            .modifier(BackgroundModifier())
            
        }
    }
}
