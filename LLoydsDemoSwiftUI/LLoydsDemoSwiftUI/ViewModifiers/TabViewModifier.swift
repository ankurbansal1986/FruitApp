//
//  TabViewModifier.swift
//  LLoydsDemoSwiftUI
//
//  Created by Ankur Bansal on 23/01/24.
//

import Foundation
import SwiftUI
struct TabViewModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .toolbarBackground(Constants.tabBarBackgroundColor, for: .tabBar)
            .toolbarBackground(.visible, for: .tabBar)
            .toolbarColorScheme(.none, for: .tabBar)
    }
}
