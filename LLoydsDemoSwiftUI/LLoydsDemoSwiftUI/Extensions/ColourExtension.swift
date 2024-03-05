//
//  ColourExtension.swift
//  LLoydsDemoSwiftUI
//
//  Created by Ankur Bansal on 15/01/24.
//

import Foundation
import SwiftUI
extension Color: RawRepresentable {
    // initialize color from string
    public init?(rawValue: String) {
        
        guard let data = Data(base64Encoded: rawValue) else {
            self = .black
            return
        }
        
        do {
           let color = try  NSKeyedUnarchiver.unarchivedObject(ofClass: UIColor.self, from: data) ?? .black
            self = Color(color)
        } catch {
            self = .black
        }
    }
    
    // convert color to string
    public var rawValue: String {
        do {
            let data = try NSKeyedArchiver.archivedData(withRootObject: UIColor(self), requiringSecureCoding: false) as Data
            return data.base64EncodedString()
        } catch {
            return ""
        }
        
    }
    
}
