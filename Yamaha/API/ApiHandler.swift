//
//  ApiHandler.swift
//  Yamaha
//
//  Created by SmartVenture on 5/8/23.
//

import Foundation
import Alamofire


class ApiHandler {
  static let sharedInstance = ApiHandler()
  
  func fetchingAPIData(handler: @escaping (_ apiData: [ProductResponse]) -> (Void)) {
//    let url = "https://jsonplaceholder.typicode.com/posts/"
    let url = Constants.baseURL + "filterAll?lim=11&p=1"
    let headers: HTTPHeaders = [ "Authorization": Constants.token]
    
    AF.request(url, method: .post, parameters: nil, encoding: URLEncoding.default, headers: headers, interceptor: nil).response { response in
      switch response.result {
      case .success(let data):
        
        do {
          let jsonData = try JSONDecoder().decode(Model.self, from: data!)
          print("Sample: \(jsonData.d)")
          handler(jsonData.d)
        } catch {
          print(error.localizedDescription)
          print(String(describing: error))
        }
      case .failure(let error):
        print(error.localizedDescription)
      }
    }
    
  }
  
}

struct Model: Decodable {
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
