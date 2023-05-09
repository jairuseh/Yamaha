//
//  ProductModel.swift
//  Yamaha
//
//  Created by SmartVenture on 5/9/23.
//

import Foundation

struct ProductModel: Decodable {
//  let userId: Int
//  let id: Int
//  let title: String
//  let body: String
  let d: [ProductResponse]
}

struct ProductResponse: Decodable {
  let name: String
  let description: String
  let productPrice: ProductPrice
  let imageUrls: [String]
}

struct ProductPrice: Decodable {
  let retailPrice: Double
}
