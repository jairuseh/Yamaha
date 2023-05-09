//
//  Product.swift
//  Yamaha
//
//  Created by SmartVenture on 5/2/23.
//

import Foundation

struct Product: Decodable {
  var id: Int
  var name: String
  var price: Double
  
  var productImage: URL? {
    return URL(string: "https://picsum.photos/200/300")
  }
  
}

extension Product {
  
  public static func getMockProductArray() -> [Product] {
    return [
      Product(id: 1, name: "Bitcoin", price: 1299),
      Product(id: 2, name: "Etherium", price: 800),
      Product(id: 3, name: "Xrp", price: 25),
      Product(id: 4, name: "Cardano", price: 25),
      Product(id: 5, name: "Solana", price: 25),
      Product(id: 6, name: "Polkadot", price: 253),
      Product(id: 7, name: "Solana", price: 55),
      Product(id: 8, name: "Polkadot", price: 12),
      Product(id: 9, name: "Solana", price: 2565),
      Product(id: 10, name: "Polkadot", price: 523),
      Product(id: 11, name: "Polkadot1", price: 1523),
    ]
  }
}
