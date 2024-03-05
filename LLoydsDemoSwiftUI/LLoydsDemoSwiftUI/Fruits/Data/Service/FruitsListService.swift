//
//  FruitsListService.swift
//  LLOYDSDEMO
//
//  Created by Ankur Bansal on 07/01/24.
//

import Foundation

struct AllFruitsListEndpoint: Endpoint {
    var path: String {
        return "/api/fruit/all"
    }
    
    var method: RequestMethod {
        return .get
    }
    
    var jsonFileName: String {
        return "AllFruits"
    }
}

// network service for fruits
protocol FruitsListServiceable {
    func getAllFruits() async -> Result<[FruitDomainModel], RequestError>
   
}

struct FruitsListService: HTTPClient, FruitsListServiceable {
    func getAllFruits() async -> Result<[FruitDomainModel], RequestError> {
        return await sendRequest(endpoint: AllFruitsListEndpoint(), responseModel: [FruitDomainModel].self)
    }
}
