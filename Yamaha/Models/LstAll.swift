//
//  LstAll.swift
//  Yamaha
//
//  Created by SmartVenture on 5/3/23.
//

import Foundation

struct LstAll {
  let id: Int
  let lstAllName: String
  let lstAllPrice: Double
}

extension LstAll {
  
  public static func getMockArrayLstAll() -> [LstAll] {
    [
      LstAll(id: 1, lstAllName: "name1", lstAllPrice: 20),
      LstAll(id: 2, lstAllName: "name2", lstAllPrice: 40),
      LstAll(id: 3, lstAllName: "name3", lstAllPrice: 60),
      LstAll(id: 4, lstAllName: "name4", lstAllPrice: 80),
      LstAll(id: 5, lstAllName: "name5", lstAllPrice: 90),
      LstAll(id: 6, lstAllName: "name6", lstAllPrice: 100),
    ]
  }
  
}
