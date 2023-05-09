//
//  IList.swift
//  Yamaha
//
//  Created by SmartVenture on 5/4/23.
//

import Foundation

protocol IList {
  var i_id: Int { get }
  var i_name: String { get }
  var i_price: Double { get }
  var i_image: URL? { get }
}

extension Product: IList {
  var i_id: Int { return id }
  var i_name: String { return name }
  var i_price: Double { return price }
  var i_image: URL? { return productImage }
}

extension LstAll: IList {
  var i_id: Int { return id }
  var i_name: String { return lstAllName }
  var i_price: Double { return lstAllPrice }
  var i_image: URL? { return lstAllImage }
}

extension Bolo: IList {
  var i_id: Int { return id }
  var i_name: String { return boloName }
  var i_price: Double { return boloPrice }
  var i_image: URL? { return boloImage }
}
