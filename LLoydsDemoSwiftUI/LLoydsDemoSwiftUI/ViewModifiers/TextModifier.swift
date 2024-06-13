//
//
//  TitleTextModifier.swift
//  LLoydsDemoSwiftUI
//
//  Created by Ankur Bansal on 11/01/24.
//

import Foundation
import SwiftUI
struct TextModifier: ViewModifier {
    @EnvironmentObject private var theme: Theme
    var fontStyle: Font.TextStyle = .title2
    var textColor: Color?
    
    func body(content: Content) -> some View {
        content
            .font(.system(fontStyle))
        
            .foregroundColor(textColor ?? theme.textColor)
    }
}
