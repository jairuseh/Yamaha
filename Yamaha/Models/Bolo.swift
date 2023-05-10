//
//  Bolo.swift
//  Yamaha
//
//  Created by SmartVenture on 5/3/23.
//

import Foundation

struct BoloListResponse: Decodable {
  let d: [Bolo]
}

struct Bolo: Decodable {
  let id: String
  let boloName: String
  let suggestedBudget: Int
  let image: [String]
  
  private enum CodingKeys: String, CodingKey {
    case id = "_id"
    case boloName = "boloingFor"
    case suggestedBudget
    case image = "imageUrls"
    
  }
  
  
}

