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
    @Published var foregoundColor: Color = getForeGroundColor()
    @Published var titleColor: Color = getTitleColor()
    
    static func getTextColor() -> Color {
        if let rawValue = UserDefaults.standard.value(forKey: Constants.textColor) as? String {
            return Color(rawValue: rawValue) ?? .black
        } else {
            return .gray
        }
    }
    
    static func getBackGroundColor() -> Color {
        if let rawValue = UserDefaults.standard.value(forKey: Constants.backgroundColor) as? String {
            return Color(rawValue: rawValue) ?? .white
        } else {
            return Color(red: 211.0/255, green: 211.0/255, blue: 211.0/255)
        }
    }
    
    static func getForeGroundColor() -> Color {
        if let rawValue = UserDefaults.standard.value(forKey: Constants.foregroundColor) as? String {
            return Color(rawValue: rawValue) ?? .white
        } else {
           return .white
        }
    }
    
    static func getTitleColor() -> Color {
        if let rawValue = UserDefaults.standard.value(forKey: Constants.titleColor) as? String {
            return Color(rawValue: rawValue) ?? .white
        } else {
           return .black
        }
    }
}
