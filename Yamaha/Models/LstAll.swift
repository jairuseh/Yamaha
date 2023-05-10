//
//  LstAll.swift
//  Yamaha
//
//  Created by SmartVenture on 5/3/23.
//

import Foundation

struct LstAllListResponse: Decodable {
  let d: [LstAll]
}

struct LstAll: Decodable {
  let id: String
  let lstAllName: String
  let quantity: Double
  let image: String
  
  private enum CodingKeys: String, CodingKey {
    case id = "_id"
    case lstAllName = "name"
    case quantity
    case image = "imageUrl"
  }
}


