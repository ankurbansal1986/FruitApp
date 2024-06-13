//
//  FruitCellModel.swift
//  LLOYDSDEMO
//
//  Created by Ankur Bansal on 08/01/24.
//

import Foundation
// protocol for rendering fruit model
protocol FruitRenderModel: Identifiable {
    var title: String {get}
    var nameString: String {get}
    var familyString: String {get}
    var orderString: String {get}
    var genusString: String {get}
    var caloriesString: String {get}
    var fatString: String {get}
    var carbohydtrateString: String {get}
    var sugarString: String {get}
    var proteinString: String {get}
}

extension FruitModel: FruitRenderModel {
   
    var title: String {
        (name ?? "")
    }
    
    var nameString: String {
        "\(name ?? "")"
    }
    
    var familyString: String {
        "\(String(localized: "Family:", table: "FruitsLocalization")) \(family ?? "")"
    }
    
    var orderString: String {
        "\(String(localized: "Order:", table: "FruitsLocalization")) \(order ?? "")"
    }
    
    var genusString: String {
        "\(String(localized: "Genus:", table: "FruitsLocalization")) \(genus ?? "")"
    }
    
    var caloriesString: String {
        "\(String(localized: "Calories:", table: "FruitsLocalization")) \(nutritions?.calories ?? 0)"
    }
    
    var fatString: String {
        "\(String(localized: "Fat:", table: "FruitsLocalization")) \(nutritions?.fat ?? 0)"
    }
    
    var carbohydtrateString: String {
        "\(String(localized: "Carbohydrates:", table: "FruitsLocalization")) \(nutritions?.carbohydrates ?? 0)"
    }
    
    var sugarString: String {
        "\(String(localized: "Sugar:", table: "FruitsLocalization")) \(nutritions?.sugar ?? 0)"
    }
    
    var proteinString: String {
        "\(String(localized: "Protein:", table: "FruitsLocalization")) \(nutritions?.protein ?? 0)"
    }
    
}
