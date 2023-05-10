//
//  Product.swift
//  Yamaha
//
//  Created by SmartVenture on 5/2/23.
//

import Foundation

struct ProductListResponse: Decodable {
  let d: [Product]
}

struct Product: Decodable {
  let id: String
  let name: String
  let price: ProductPrice
  let image: [String]
  
  private enum CodingKeys: String, CodingKey {
      case id = "_id"
      case name
      case price = "productPrice"
      case image = "imageUrls"
    }
  
}

struct ProductPrice: Decodable {
  let retailPrice: Double
  

  
}


