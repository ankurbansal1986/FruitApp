//
//  Theme.swift
//  LLoydsDemoSwiftUI
//
//  Created by Ankur Bansal on 15/01/24.
//

import Foundation
import SwiftUI
final class Theme: ObservableObject {
    @Published var textColor: Color = getTextColor()
    @Published var rowBackgroundColor: Color = .clear
    @Published var backgroundColor: Color = getBackGroundColor()
    
    static func getTextColor() -> Color {
        if let rawValue = UserDefaults.standard.value(forKey: Constants.textColor) as? String {
            return Color(rawValue: rawValue) ?? .black
        } else {
            return .black
        }
    }
    
    static func getBackGroundColor() -> Color {
        if let rawValue = UserDefaults.standard.value(forKey: Constants.backgroundColor) as? String {
            return Color(rawValue: rawValue) ?? .white
        } else {
            return .white
        }
    }
}
