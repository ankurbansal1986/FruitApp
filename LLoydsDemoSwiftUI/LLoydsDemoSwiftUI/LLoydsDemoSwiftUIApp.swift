//
//  LLoydsDemoSwiftUIApp.swift
//  LLoydsDemoSwiftUI
//
//  Created by Ankur Bansal on 11/01/24.
//

import SwiftUI

@main
struct LLoydsDemoSwiftUIApp: App {
    @StateObject private var currentTheme = Theme()
    var body: some Scene {
        WindowGroup {
            CustomTabView().environmentObject(currentTheme)
        }
    }
}

extension LLoydsDemoSwiftUIApp: Navigator {}
