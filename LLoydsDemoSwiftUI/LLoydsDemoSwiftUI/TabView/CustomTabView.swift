//
//  CustomTabView.swift
//  LLoydsDemoSwiftUI
//
//  Created by Ankur Bansal on 23/01/24.
//

import Foundation
import SwiftUI

struct CustomTabView: View {
    var body: some View {
        TabView {
            Group {
                // First Tab
                rootView()
                    .tabItem {
                        Image(systemName: Constants.houseIcon)
                        Text(String(localized: "Home", table: "FruitsLocalization"))
                    }
                
                // Second Tab
                settingsView()
                    .tabItem {
                        Image(systemName: Constants.settingsIcon)
                        Text(String(localized: "Settings", table: "FruitsLocalization"))
                    }
            }
            .modifier(TabViewModifier())
        }
    }
}

extension CustomTabView: Navigator {}
