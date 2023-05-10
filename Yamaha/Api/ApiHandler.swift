//
//  ApiHandler.swift
//  Yamaha
//
//  Created by SmartVenture on 5/9/23.
//

import Foundation
import Alamofire

class ApiHandler {
  static let sharedInstance = ApiHandler()
  
  func getProductList(handler: @escaping (_ apiData: [Product]) -> (Void)) {
    let url = Constants.baseUrl + "filterAll?lim=11&p=1"
    let headers: HTTPHeaders = [ "Authorization": Constants.token]
    
    AF.request(url, method: .post, parameters: nil, encoding: URLEncoding.default, headers: headers, interceptor: nil).response { response in
      switch response.result {
      case .success(let data):
        
        do {
          let jsonData = try JSONDecoder().decode(ProductListResponse.self, from: data!)
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
  
  func getLstAllList(handler: @escaping (_ apiData: [LstAll]) -> (Void)) {
    let url = Constants.baseUrl + "lstAll?p=1&lim=50"
    let headers: HTTPHeaders = [ "Authorization": Constants.token]
    
    AF.request(url, method: .post, parameters: nil, encoding: URLEncoding.default, headers: headers, interceptor: nil).response { response in
      switch response.result {
      case .success(let data):
        
        do {
          let jsonData = try JSONDecoder().decode(LstAllListResponse.self, from: data!)
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
  
  func getBoloList(handler: @escaping (_ apiData: [Bolo]) -> (Void)) {
    let url = Constants.baseUrl + "allWatchLists?p=1&lim=50"
    let headers: HTTPHeaders = [ "Authorization": Constants.token]
    
    AF.request(url, method: .post, parameters: nil, encoding: URLEncoding.default, headers: headers, interceptor: nil).response { response in
      switch response.result {
      case .success(let data):
        
        do {
          let jsonData = try JSONDecoder().decode(BoloListResponse.self, from: data!)
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
