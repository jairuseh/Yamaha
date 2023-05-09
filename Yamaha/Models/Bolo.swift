//
//  Bolo.swift
//  Yamaha
//
//  Created by SmartVenture on 5/3/23.
//

import Foundation

struct Bolo {
  let id: Int
  let boloName: String
  let boloPrice: Double
  
  var boloImage: URL? {
    return URL(string: "https://picsum.photos/200/300")
  }
}

extension Bolo {
  
  public static func mockArrayBolo() -> [Bolo] {
    [
      Bolo(id: 1, boloName: "bolo name1", boloPrice: 345),
      Bolo(id: 2, boloName: "bolo name2", boloPrice: 123),
      Bolo(id: 3, boloName: "bolo name3", boloPrice: 567),
      Bolo(id: 4, boloName: "bolo name4", boloPrice: 678),
      Bolo(id: 5, boloName: "bolo name5", boloPrice: 321),
      Bolo(id: 6, boloName: "bolo name6", boloPrice: 654),
      Bolo(id: 7, boloName: "bolo name7", boloPrice: 734),
      Bolo(id: 8, boloName: "bolo name8", boloPrice: 54),
      
    ]
  }
}
